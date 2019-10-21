//Verilog HDL for "COMP12111_lib", "fullbitadderv" "functional"


module fullbitadderv (input reg a,b,cin
		      output reg sum, carry);
always @ (*)
	begin
		assign sum = (a ^ b) ^ cin
		assign carry = cin & (a ^ b) | a & b 
	end

endmodule
