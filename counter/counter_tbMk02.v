module test;

/* Make a reset that pulse once. */

reg reset = 0;
reg enable = 0;
initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    #17 reset = 1;
    #11 reset = 0;
    #29 reset = 1;
    #5 reset = 0;
    #513 $finish;
end

/* Make a regular pulsing clock. */
reg clk = 0;
always #1 clk = !clk;

wire [7:0] value;
counter c1 (
    .out(value),
    .clk(clk),
    .reset(reset),
    .enable(enable)
);

initial begin
    $monitor("At time %t, value = %h (%0d)", $time, value, value);
    #20 enable = 1; // Enable the counter after some delay
    #100 enable = 0; // Disable the counter after some cycles
	#20 enable = 1; // Enable the counter after some delay
    #100 enable = 0; // Disable the counter after some cycles
end

endmodule // test