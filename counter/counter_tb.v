module test;

/* Make a reset that pulse once. */
reg reset = 0;                        // Declare reset signal and initialize to 0
initial begin
	$dumpfile("test.vcd");           // Specify the name of the VCD file for waveform dumping
	$dumpvars(0,test);               // Dump variables for waveform

	#17 reset = 1;                    // Assert reset after 17 time units
	#11 reset = 0;                    // Deassert reset after 11 time units
	#29 reset = 1;                    // Assert reset again after 29 time units
	#5 reset = 0;                     // Deassert reset after 5 time units
	#513 $finish;                     // Finish simulation after 513 time units
end

/* Make a regular pulsing clock. */
reg clk = 0;                          // Declare clock signal and initialize to 0
always #1 clk = !clk;                 // Toggle clock every 1 time unit

wire[7:0] value;                      // Declare wire to capture counter output
counter c1 (value, clk, reset);       // Instantiate the counter module

initial
	$monitor("At time %t, value = %h (%0d)", $time, value, value); // Display time and counter value

endmodule // test