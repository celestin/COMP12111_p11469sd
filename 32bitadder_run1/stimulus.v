
// Verilog stimulus file.
// Please do not create a module in this file.
/*

#VALUE      creates a delay of VALUE ns
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

initial
begin
#100 
// Enter you stimulus below this line

a=32b'11110000000000001111000000000000;
b=32b'11110000000000001111000000000000;
cin = 0;
#100
// Please make sure your stimulus is above this line 
$stop;
end 
