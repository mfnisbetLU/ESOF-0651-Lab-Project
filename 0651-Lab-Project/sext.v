//8 to 16 bit sign extender
module sext(clk,in,inExtend);
input [7:0]in;
input clk;
output [15:0]inExtend;

reg [15:0]inExtend;
always@(posedge clk)
	begin
	inExtend[15:0] <= { {8{in[7]}}, in[7:0]}; //Extends the input by 8 bits (one byte), <= means it executes in parallel 
	end
endmodule 
