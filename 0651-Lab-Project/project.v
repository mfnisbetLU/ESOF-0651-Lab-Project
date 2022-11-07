module project(clk,in_port,out_port);

input clk;
input [7:0]in_port;
output [7:0]out_port;

wire [7:0]PCout;
wire [7:0]PCin;
wire [1:0]ra;
wire [1:0]rb;
wire [3:0]op;
wire [7:0]rav;
wire [7:0]rbv;
wire [7:0]wb;

add2 add2Mod(PCout,PCin);
programCounter pcMod(PCin,PCout,clk);
instructionMemory imMod(PCout,ra,rb,op);
registerFile rfMod(ra,rb,rav,rbv,wb,clk);
alu aluMod(rav,rbv,op,wb,in_port,out_port);

endmodule