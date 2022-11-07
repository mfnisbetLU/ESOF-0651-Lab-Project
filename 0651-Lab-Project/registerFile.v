module registerFile(ra,rb,rav,rbv,wb,clk);

input [1:0]ra;
input [1:0]rb;
input [7:0]wb;
input clk;
output [7:0]rav;
output [7:0]rbv;

reg [7:0]mem[0:3];

initial begin
	mem[0]=1;
	mem[1]=2;
	mem[2]=3;
	mem[3]=4;
end

assign rav=mem[ra];
assign rbv=mem[rb];

always @(negedge clk) begin
	mem[ra]=wb;
end

endmodule