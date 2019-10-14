// Verilog stimulus file.
// Please do not create a module in this file.
/*

#VALUE      creates a delay of VALUE ns
a=VALUE;    sets the value of input 'a' to VALUE
$stop;      tells the simulator to stop

*/

initial
begin
#100 bcd=0;

// Enter you stimulus below this line
// Make sure you test all input combinations with a delay
// -------------------------------------------------------

#100 bcd=1;
#100 bcd=2;
#100 bcd=3;
#100 bcd=4;
#100 bcd=5;
#100 bcd=6;
#100 bcd=7;
#100 bcd=8;
#100 bcd=9;
#100 bcd=10;
#100 bcd=11;
#100 bcd=12;
#100 bcd=13;
#100 bcd=14;
#100 bcd=15;



// -------------------------------------------------------
// Please make sure your stimulus is above this line
 
#100 $stop;
end
