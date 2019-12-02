//Verilog HDL for "MU0_lib", "mux_2to1_16bit" "functional"


module mux_2to1_16bit ( output reg [15:0] q,
			input [15:0] a,
			input [15:0] b,
			input sel);

always @ (*)
begin
    case (sel)
        1'b0: q = a;
        1'b1: q = b;
	default: q = 16'bX;
    endcase
end
endmodule
