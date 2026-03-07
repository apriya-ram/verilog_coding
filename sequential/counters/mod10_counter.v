// Mod-10 Counter (BCD Counter)
module mod10_counter (
    input clk,          // Clock input
    input rst,          // Reset input (active high)
    input enable,       // Enable input
    output reg [3:0] count  // 4-bit BCD output (0-9)
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;  // Reset to 0
        end
        else if (enable) begin
            if (count == 4'b1001)  // When count reaches 9
                count <= 4'b0000;  // Reset to 0
            else
                count <= count + 1'b1;  // Increment count
        end
    end

endmodule
