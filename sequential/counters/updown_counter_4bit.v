// 4-bit Up/Down Counter - Behavioral Model
module updown_counter_4bit (
    input clk,
    input rst,
    input up_down,
    input enable,
    output reg [3:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end
        else if (enable) begin
            if (up_down)
                count <= count + 1'b1;  // Up counting
            else
                count <= count - 1'b1;  // Down counting
        end
    end

endmodule

