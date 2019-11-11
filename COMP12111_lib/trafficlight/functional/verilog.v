// Verilog HDL for "COMP12111", "trafficlight" "functional"
//
// COMP12111 - Exercise 3 Sequential Design
//
// Version 1. Feb 2019. P W Nutter
//
// This is the Verilog module for the pedestrian/cyclist crossing Controller
//
// The aim of this exercise is complete the finite state machine using the
// state transition diagram given in the laboratory notes. 
//
// DO NOT change the interface to this design or it may not be marked completely
// when submitted.
//
// Make sure you document your code and marks may be awarded/lost for the 
// quality of the comments given.
//
// Add your comments:
// Author: Sam da Costa
//
//

module trafficlight ( output reg [5:0] 	lightseq,	//the 6-bit light sequence
		      input             clock,		//clock that drives the fsm
		      input             reset,		//reset signal 
		      input             start);		//input from pedestrian



// declare internal variables here (how many bits required?)
reg [3:0] next_state;
reg [3:0] current_state;

// implement your next state combinatorial logic block here
always @ (*)
begin
  case(current_state)
	//determine next state
    4'b0000:	if (start) next_state = 4'b0001;
		else	   next_state = 4'b0000;
    4'b0001:    next_state = 4'b0010;
    4'b0010:    next_state = 4'b0011;
    4'b0011:    next_state = 4'b0100;
    4'b0100:    next_state = 4'b0101;
    4'b0101:    if (start) next_state = 4'b1000;
  		else       next_state = 4'b0110;
    4'b0110:    if (start) next_state = 4'b1001;
		else	   next_state = 4'b0111;
    4'b0111:	if (start) next_state = 4'b1010;
		else	   next_state = 4'b0000;
    4'b1000:    next_state = 4'b1001;
    4'b1001:	next_state = 4'b1010;
    4'b1010:    next_state = 4'b0001;
    default:	next_state = 4'b0000;
  endcase
end

// implement your current state assignment, register, here

always @ (posedge clock, posedge reset)
begin
  if (reset) // reset to state 0 if not caught
    current_state <= 4'b0000;
  else
    current_state <= next_state; // move to next state
end
// implement your output logic here

always @ (*)
begin
  case(current_state)
	// set lights
    4'b0000:    lightseq = 6'b001100;
    4'b0001:    lightseq = 6'b010100;
    4'b0010:    lightseq = 6'b100001;
    4'b0011:    lightseq = 6'b100001;
    4'b0100:    lightseq = 6'b100001;
    4'b0101:    lightseq = 6'b110100;
    4'b0110:    lightseq = 6'b001100;
    4'b0111:    lightseq = 6'b001100;
    4'b1000:    lightseq = 6'b001100;
    4'b1001:    lightseq = 6'b001100;
    4'b1010:    lightseq = 6'b001100;
    default:    lightseq = 6'b000000;
  endcase
end


endmodule
