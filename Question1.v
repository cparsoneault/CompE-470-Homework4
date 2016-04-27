`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Question 1 multiply accumulator
//////////////////////////////////////////////////////////////////////////////////
module Question1 #(parameter width = 4)(clk, op1, op2, out);
input clk; //clk is the clock signal
input [width-1:0] op1, op2; //op1 and op2 are the two operands to be entered
output [4 * width - 1:0] out; // out is the result of op1/2 being passed through

//inner wires to connect the instantiated modules with
wire [2* width - 1: 0] mulOut1, r1out, r2out;
wire [width-1:0] xr1Out, xr2Out;
wire [4*width-1:0] mulOut2;

multiplier #(.width(width)) m1 (.a(op1),.b(op2),.mult(mulOut1));
myReg #(.width(2*width)) r1 (.d(mulOut1), .q(r1out), .clk(clk)); //r1 and r2 are connected to the output of m1
myReg #(.width(2*width)) r2 (.d(r1out), .q(r2out), .clk(clk));
myReg #(.width(width)) xr1 (.d(op1), .q(xr1Out), .clk(clk));	
//xr1 and xr2 are connected to op1
myReg #(.width(width)) xr2 (.d(xr1Out), .q(xr2Out), .clk(clk));
multiplier #(.width(2*width)) m2 (.a(r2out),.b({{width{xr2Out[width-1]}},xr2Out}),.mult(mulOut2));
//.b had to be sign extended for this multiplier
myReg #(.width(4*width)) o1 (.d(mulOut2), .q(out), .clk(clk));

endmodule

module multiplier #(parameter width = 4) (a, b, mult);
	input signed [width-1:0]a,b;
	output reg signed[2 * width - 1 : 0] mult;
	always @ *
		mult = a * b;
endmodule

module myReg #(parameter width = 4) (clk, d, q);
	input clk;
	input [width-1:0] d;
	output reg [width-1:0] q;
	always @ (posedge clk)
		q <= d;
endmodule

module tb_Question1;
	parameter N = 4;
	reg clk;
	reg [N-1:0] op1, op2;
	wire [4*N-1:0] out;
	
	Question1 #(.width(N)) q1 (.clk(clk), .op1(op1), .op2(op2), .out(out));

	initial clk = 0;
	always #10 clk = ~clk;
	
	initial begin
	op1 = 4'sb1111; op2 = 4'sb0001;
	#20 op2 = 4'sb0101;
	#20 op2 = 4'sb0011;
	#20 op2 = 4'sb1001;
	#50;
	end
	
endmodule
