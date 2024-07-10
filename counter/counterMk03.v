module counter(
    output reg [WIDTH-1 : 0] out,
    input clk, 
    input reset, 
    input enable,
    input counter_valid
);

parameter WIDTH = 8;

always @(posedge clk) begin
    if (reset)
        out <= 0;
    else if (enable && counter_valid)
        out <= out + 1;
end

endmodule // counter