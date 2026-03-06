//Starting the sequential logic coding with D flipflop
module dff_async_reset_low (
    input d,
    input clk,
    input rst_n,       // Asynchronous reset active low
    output reg q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;    // Reset when rst_n is low
        else
            q <= d;
    end

endmodule
