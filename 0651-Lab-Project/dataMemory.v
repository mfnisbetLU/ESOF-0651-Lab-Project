//Data Memory Module
module dataMemory(clk, op, ra_dm, addr_dm, dm_out);

input clk;
input [7:0]ra_dm; // Data from register being operated on
input [3:0]op; // Opcode from byte 1
input [7:0]addr_dm; // Address in data memory array
output [7:0] dm_out;

reg [7:0] read_data_dm;
reg [7:0]datamem[0:255]; // Memory of 256 bytes

integer i;
initial begin
read_data_dm <= 0; // Initial value of read_data_dm set to 0
	for (i = 0; i < 256; i = i + 1) begin 
		datamem[i] = i; // Fills data memory with address number
	end
end


always @(posedge clk) begin
	if(op == 4'b1101) begin // Load instruction OP=13
		read_data_dm <= datamem[addr_dm]; // Read_data is set to those values of datamem address
	end
	else if(op == 4'b1110) begin // Store instruction OP=14
		datamem[addr_dm] <= ra_dm; // Memory address space is set to write_data
	end
	else if(op == 4'b1111) begin
		read_data_dm <= addr_dm; 
	end
	
end

assign dm_out = read_data_dm; 

endmodule 
	