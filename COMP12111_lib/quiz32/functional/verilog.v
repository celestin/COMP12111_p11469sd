//Verilog HDL for "COMP12111_lib", "quiz32" "functional"


module quiz32 (input	CLK, R, a,
	       output reg       s);
reg [1:0] next_st;
reg [1:0] current_st;

always @ (*)
  case(current_st)
    2'b00: if(a == 1) next_st = 2'b01;
	   else	      next_st = 2'b00;
    2'b01: next_st = 2'b10;
    2'b10: next_st = 2'b11;
    2'b11: next_st = 2'b00;
    default: next_st = 2'bX;
  endcase

always @ (posedge CLK, posedge R)
  if(R)
    current_st <= 2'b00;
  else
    current_st <= next_st;

always @ (*)
  case (current_st)
    2'b00: s = 0;
    2'b01: s = 1;
    2'b10: s = 0;
    2'b11: s = 1;
    default: s = 2'bX;
  endcase

endmodule;
