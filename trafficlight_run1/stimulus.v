// Verilog stimulus file.
// Please do not create a module in this file.
//
// Testing of a sequential design requires you to implement
// a clock - see the advice in Blackboard on how to do this
//

/*

#VALUE      creates a delay of VALUE ns
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/
initial clock = 0;
// Implement your clock here
// -----------------------------------------------------
always
  begin
  #50
  clock = ~clock;
  end




// -----------------------------------------------------


initial
begin

// Set input signals here, using delays where appropriate
// -----------------------------------------------------
start = 0;
reset = 0;
#50
reset = 1;
#50
reset = 0;
#100
// test outer loop
start = 1;
#100
start = 0;
#800
// test inner loop
start = 1;
#900
start = 0;
#1000


// test break after state 6
start = 1;
#100
start = 0;
#450
start = 1;
#150
start = 0;
#1400

//test break after state 7
start = 1;
#100
start = 0;
#550
start = 1;
#150
start = 0;
#1000



#100 $stop;
end
