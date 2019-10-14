// Verilog HDL for "COMP12111_lib", "sevensegmentdecoder" "functional"
// Created P W Nutter, 20/3/19
//
// Add your comments here ...


module sevensegmentdecoder (input [3:0] bcd,
			    output reg 	[7:0] segments);

// create an always block to represent the desired behaviour of the
// combinatorial design
// -----------------------------------------------------------------
always @ (bcd)
  case (bcd)
    4'b0000: segments = 8'b00111111;//0
    4'b0001: segments = 8'b00000110;//1
    4'b0010: segments = 8'b01011011;//2
    4'b0011: segments = 8'b01001111;//3

    4'b0100: segments = 8'b01100110;//4
    4'b0101: segments = 8'b01101101;//5
    4'b0110: segments = 8'b01111101;//6
    4'b0111: segments = 8'b00000111;//7

    4'b1000: segments = 8'b01111111;//8
    4'b1001: segments = 8'b01101111;//9
    4'b1010: segments = 8'b01110111;//A
    4'b1011: segments = 8'b01111100;//B

    4'b1100: segments = 8'b00111001;//C
    4'b1101: segments = 8'b01011110;//D
    4'b1110: segments = 8'b01111001;//E
    4'b1111: segments = 8'b01110001;//F
  endcase

endmodule  // end of module sevensegmentdecoder
