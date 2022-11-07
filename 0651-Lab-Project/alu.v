module alu(ra,rb,op,out,in_port,out_port);

input [7:0]ra;
input [7:0]rb;
input [3:0]op;
input [7:0]in_port;
output [7:0]out;
output [7:0]out_port;

reg [7:0]out_port;

assign out=(op==4'b0001)?ra+rb: //add
	(op==4'b0010)?ra-rb: //sub
	(op==4'b0011)?~(ra&rb): //nand
	(op==4'b0100)?ra<<1: //shl
	(op==4'b0101)?ra>>1: //shr
	(op==4'b0111)?in_port: //in
	(op==4'b1000)?rb : ra; //mov nop
always @(op==4'b0110) begin
	out_port=ra;
end

endmodule