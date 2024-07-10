    //////////////////////////////////////////////////////////////////////
    // Module Name: adder_4b.v
    // Description: Counter with clock gating and counter valid control
    // Designer: Barney Peng
    // Date: 03/11/2024
    //////////////////////////////////////////////////////////////////////



    module adder_4b (

        input [WIDTH-1:0] i_a,
        input [WIDTH-1:0] i_b,
        output [WIDTH:0] o_sum
    
    );
        reg [WIDTH:0] sum_p;

    parameter WIDTH = 4; 

    always @(*) begin
        sum_p = i_a + i_b;
    end

    assign o_sum = sum_p;

    endmodule