// 2 to 1 multiplexer
module mux2_1(in0, in1, s, out);
input [7:0]in0; 
input [7:0]in1;
input s;
output [7:0]out;


assign out = s ? in1 : in0; // ? is the ternary operator

endmodule 
