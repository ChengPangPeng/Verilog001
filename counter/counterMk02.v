module counter(
    output reg [WIDTH-1 : 0] out,
    input clk, 
    input reset, 
    input enable
);

parameter WIDTH = 8;

always @(posedge clk) begin
    if (reset)
        out <= 0;
    else if (enable)
        out <= out + 1;
end

endmodule // counter