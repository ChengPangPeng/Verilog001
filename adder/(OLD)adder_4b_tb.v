//////////////////////////////////////////////////////////////////////
// Module Name: adder_4b_tb.v
// Description: Counter with clock gating and counter valid control
// Designer: Barney Peng
// Date: 03/11/2024
//////////////////////////////////////////////////////////////////////

module adder_4b_tb;

    parameter WIDTH = 4;

    reg [WIDTH-1:0] i_a;
    reg [WIDTH-1:0] i_b;
    wire [WIDTH:0] o_sum;



    initial begin
        i_a <= 4'b0000;
        i_b <= 4'b0000;
    
        #20; // Delay to allow simulation to progress


        #10; i_a <= 4'b0001;
        #10; i_b <= 4'b0001;
    
        
        #10; i_a <= 4'b0000;
        #10; i_b <= 4'b0001;
    
        

        #10; i_a <= 4'b1111;
        #10; i_b <= 4'b1111;

        

        #10; i_a <= 4'b0000;
        #10; i_b <= 4'b0000;

        #1000;
        $finish;
    end

    initial begin
        $monitor("At time %t, o_sum = %h (%0d)", $time, o_sum, o_sum);
    end

    initial begin
        $dumpfile("adder_4b.vcd");
        $dumpvars(0, adder_4b_tb);
    end
    

adder_4b u_adder_4b (
 
    .i_a(i_a),
    .i_b(i_b),
    .o_sum(o_sum)

);

endmodule