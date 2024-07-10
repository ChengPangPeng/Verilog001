module test;

//Reference: https://youtu.be/5Kync4z5VOw?si=u34tsfena2Eo7J3K

    /* Make a reset that pulses once. */
    reg reset;
    reg enable;
    reg counter_valid; 
    //give initial values to the signals
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,test);
    end

    initial begin
        reset = 0;
        #17 reset = 1;
        #11 reset = 0; //remember that the total time for this reset=0 is 17+11=28

        #513 $finish;
    end
    
    /* Make a regular pulsing clock. */
    reg clk = 0;
    always #1 clk = enable ? ~clk : clk; // Toggle the clock based on enable signal
    
    wire [7:0] value;
    counter c1 (
        .out(value),
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count_valid(count_valid)
    );

initial begin   
    $monitor("At time %t, value = %h (%0d)", $time, value, value);
    #20 enable = 1; // Enable the counter after some delay
    #20 count_valid = 1; // Enable the counter after some delay

    #100 enable = 0; // Disable the counter after some cycles
    #50 count_valid = 0; // Disable the counter after some cycles

    #20 count_valid = 1; // Enable the counter after some delay
    #20 enable = 1; // Enable the counter after some delay

    #100 count_valid = 0; // Disable the counter after some cycles
    #50 enable = 0; // Disable the counter after some cycles
end

endmodule // test