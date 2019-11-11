//Verilog HDL for "COMP12111_lib", "quiz3" "functional"


module quiz3 (output reg [11:0] Q,

	      input R,
	      input CE,
	      input CLK);
reg [11:0] D;
always @ (posedge CLK)
begin
	if (R)
		begin
			Q<=12'b000000000000;
		end
	else 
	if (CE)
	begin
		Q <= D;
	end
end
endmodule
