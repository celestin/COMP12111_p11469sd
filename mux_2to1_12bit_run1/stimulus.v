
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

#100
a = 12'b101010101010;
b = 12'b010101010101;

#100
sel = 0;
#100
sel = 1;
#100


// Please make sure your stimulus is above this line 
$stop;
end 
