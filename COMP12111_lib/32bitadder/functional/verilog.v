//Verilog HDL for "COMP12111_lib", "32bitadder" "functional"


module \32bitadder  (output reg 	[31:0] sum,
		     output reg		carry,
		     input		[31:0]	a,
		     input		[31:0]	b,
		     input			cin);

assign {carry, sum} = a + b + cin;
endmodule

