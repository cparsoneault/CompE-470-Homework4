`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Question 2
//////////////////////////////////////////////////////////////////////////////////
module Question2 #(parameter N = 4)(clk, a, b, c, x, y); //calculates ax^2 + bx + c
input clk; //clock signal
input signed [N-1:0] a,b,c,x; //operands
output signed [4*N:0] y; //result

//inner wires to connect the lower level modules
wire [2*N-1:0] mul1, rA;
wire [2*N:0] add1, rB;
wire [4*N + 1:0] mul2, rC;
wire [4*N+2:0] add2, rD;

//calculates ax + b
multiplier #(.width(N)) m1 (.a(a),.b(x),.mult(mul1));
myReg #(.width(2*N)) r1 (.d(mul1), .q(rA), .clk(clk));
adder #(.width(2*N)) a1 (.op1(rA), .op2({{N{b[N-1]}},b}), .sum(add1));
myReg #(.width(2*N+1)) r2 (.d(add1), .q(rB), .clk(clk));
//

//calculates x(ax+b) and then adds c
multiplier #(.width(2*N + 1)) m2 (.a(rB),.b({{(N+1){x[N-1]}},x}),.mult(mul2));
myReg #(.width(4*N + 2)) r3 (.d(mul2), .q(rC), .clk(clk));
adder #(.width(4*N + 2)) a2 (.op1(rC), .op2({{(3*N + 2){c[N-1]}},c}), .sum(add2));
myReg #(.width(4*N + 3)) r4 (.d(add2), .q(rD), .clk(clk));
//
assign y = rD;

endmodule

module adder #(parameter width = 4)(op1, op2, sum);
	input signed [width-1:0] op1, op2;
	output reg signed [width:0] sum;
	always@*
		sum = op1 + op2;
endmodule

module tb_Question2;
	parameter N = 4;
	reg clk;
	reg [N-1:0] a,b,c,x;
	wire [4*N:0] y;
	
	Question2 #(.N(N)) q2 (.clk(clk), .a(a), .b(b), .c(c), .x(x), .y(y));
	
	initial clk = 0;
	always #5 clk = ~clk;

	initial begin
	a = 3;
	b = -4;
	c = 5;
	//x = 2;
	//x = 5;
	//x = -6;
	x = 7;
	#100;
	end

endmodule
