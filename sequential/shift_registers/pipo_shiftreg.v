// PIPO Shift Register
module pipo_shiftreg #(parameter WIDTH = 4) (
    input clk,
    input rst,
    input load,
    input [WIDTH-1:0] parallel_in,
    output reg [WIDTH-1:0] parallel_out
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            parallel_out <= 0;
        else if (load)
            parallel_out <= parallel_in;
    end
endmodule
