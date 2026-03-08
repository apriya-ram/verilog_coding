//Dflipflop with enable and asynchronous reset 
module dff_async_reset_en (
    input d,
    input clk,
    input rst,
    input en,          // Clock enable
    output reg q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else if (en)
            q <= d;
        else
            q <= q;
        // If en is 0, q holds its value
    end

endmodule
