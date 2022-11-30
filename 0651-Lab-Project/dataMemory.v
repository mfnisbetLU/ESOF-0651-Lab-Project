//Data Memory Module
module dataMemory(clk, op, ra, address, read_data);

input clk;
input [7:0]ra; // Data from register being operated on
input [3:0]op; // Opcode from byte 1
input [7:0]address; // Address in data memory array
output [7:0] read_data;

reg [7:0]read_data;
reg [7:0]datamem[0:255]; // Memory of 256 bytes

integer i;
initial begin
	read_data <= 0; // Set read data to 0
	for (i = 0; i < 256; i = i + 1) begin 
		datamem[i] = i; // Fills data memory with address number
	end
end

always @(posedge clk) begin
	if(op == 4'b1101) begin // Load instruction OP=13
		read_data <= datamem[address]; // Read_data is set to those values of datamem address
	end
	if(op == 4'b1110) begin // Store instruction OP=14
		datamem[address] <= ra; // Memory address space is set to write_data
	end
	if(op == 4'b1111) begin
		read_data <= address; 
	end
	
end

endmodule 
	