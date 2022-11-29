//Data Memory Module
module dataMemory(clk, address, mem_write, mem_read, write_data, read_data);

input clk;
input mem_write; // Memory write signal
input mem_read; // Memory read signal
input [7:0]write_data; // Data written to address
input [7:0]address; // Second byte address
output [7:0] read_data; // Output of mem address
 
reg [7:0]read_data;
reg [7:0]datamem[0:255]; // Memory of 256 bytes

integer i;
initial begin
	read_data <= 0; // Clear read data
	for (i = 0; i < 256; i = i + 1) begin 
		datamem[i] = i; // Fills data memory with address number
	end
end

always @(posedge clk) begin
	if(mem_write == 1'b1) begin // If mem_write is enabled
		datamem[address] <= write_data; // Memory address space is set to write_data
	end
	if(mem_read == 1'b1) begin // If mem_read is enabled
		read_data <= datamem[address]; // Read_data is set to those values of datamem address
	end
end

endmodule 
	