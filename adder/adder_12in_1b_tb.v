//////////////////////////////////////////////////////////////////////
// Module Name: adder_12in_1b_tb.v
// Description: 4-bit adder testbench
// Designer: Barney Peng
// Date: 04/13/2024
//////////////////////////////////////////////////////////////////////

module adder_12in_1b_tb;

    parameter WIDTH_in = 12; 
    parameter WIDTH_out = 4;

    reg [WIDTH_in -1 :0] i_a;
    wire [WIDTH_out : 0] o_sum;


    initial begin
        i_a <= 4'b0000;

        #20; // Delay to allow simulation to progress


        #10; i_a[0] <= 1'b1;
        #10; i_a[1] <= 1'b1;
        #10; i_a[2] <= 1'b1;
        #10; i_a[3] <= 1'b1;
        #10; i_a[4] <= 1'b1;
        #10; i_a[5] <= 1'b1;
        #10; i_a[6] <= 1'b1;
        #10; i_a[7] <= 1'b1;
        #10; i_a[8] <= 1'b1;
        #10; i_a[9] <= 1'b1;
        #10; i_a[10] <= 1'b1;
        #10; i_a[11] <= 1'b1;

        #10; i_a[0] <= 1'b0;
        #10; i_a[1] <= 1'b0;
        #10; i_a[2] <= 1'b0;
        #10; i_a[3] <= 1'b0;
        #10; i_a[4] <= 1'b0;
        #10; i_a[5] <= 1'b0;
        #10; i_a[6] <= 1'b0;
        #10; i_a[7] <= 1'b0;
        #10; i_a[8] <= 1'b0;
        #10; i_a[9] <= 1'b0;
        #10; i_a[10] <= 1'b0;
        #10; i_a[11] <= 1'b0;

        #10; i_a[10] <= 1'b1;
        #10; i_a[8] <= 1'b1;
        #10; i_a[6] <= 1'b1;
        #10; i_a[4] <= 1'b1;
        #10; i_a[2] <= 1'b1;
        #10; i_a[0] <= 1'b1;

        #10; i_a[1] <= 1'b1;
        #10; i_a[3] <= 1'b1;
        #10; i_a[5] <= 1'b1;
        #10; i_a[7] <= 1'b1;
        #10; i_a[9] <= 1'b1;
        #10; i_a[11] <= 1'b1;


    



        #1000;
        $finish;
    end

    initial begin
        $monitor("At time %t, o_sum = %h (%0d)", $time, o_sum, o_sum);
    end

    initial begin
        $dumpfile("adder_12in_1b.vcd");
        $dumpvars(0, adder_12in_1b_tb);
    end
    

adder_12in_1b u_adder_12in_1b (
 
    .i_a(i_a),

    .o_sum(o_sum)

);

endmodule