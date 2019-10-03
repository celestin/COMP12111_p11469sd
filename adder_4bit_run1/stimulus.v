// Verilog stimulus file.
// Please do not create a module in this file.
/*

#VALUE      creates a delay of VALUE ns
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

initial
begin
// Enter you stimulus below this line
// Using 14 test vectors the interconnect of the 4bit added can be verified 

// Check all fulladders are connected to something, S=0 cout=0 not Xs
#100 a='b0000; b='b0000; cin=0;
// Check connections for A[0], B[0], Cin, S[0], S=0001 cout=0
#100 a='b0001; b='b0000; cin=0;
#100 a='b0000; b='b0001; cin=0;
#100 a='b0000; b='b0000; cin=1;
// Check connection of carry out of the first adder
#100 a='b0001; b='b0001; cin=0;
// Check connections for A[1], B[1], S[1]
#100 a='b0010; b='b0000; cin=0;
#100 a='b0000; b='b0010; cin=0;
// ADD 7 MORE TESTS TO COMPLETE CONNECTIVITY TESTS
// for each add your test vectors before the semicolon after the delay
#100 a='b0100; b='b0000; cin=0;
#100 a='b1000; b='b0000; cin=0;
#100 a='b0000; b='b0100; cin=0;
#100 a='b0000; b='b1000; cin=0;
#100 a='b0010; b='b0010; cin=0;
#100 a='b0100; b='b0100; cin=0;
#100 a='b1000; b='b1000; cin=0;

// Connectivity tests completed.
 
// ADD TESTS FOR FINDING MAXIMUM CARRY DELAY HERE | tested, delay=8ns
// 2 test vectors required - one to initialise followed by the 2nd to exercise
// the critical path
#100 a='b0000; b='b0000; cin=0;
#100 a='b1111; b='b0001; cin=0;


// Please make sure your stimulus is above this line
// delay for end of wave traces to be visible
#100 $stop;
end
