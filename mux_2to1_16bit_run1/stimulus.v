
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

a = 16'b0101010101010101;
b = 16'b1010101010101010;

#100
sel = 0;
#100
sel = 1;
#100
sel = 1'bX;
#100
// Please make sure your stimulus is above this line 
$stop;
end 
