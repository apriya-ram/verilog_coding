// This module explains a 3 bit counter 
// Behavioral 3-bit synchronous counter
module counter_3bit_behavioral (
    input clk,
    input rst,
    output reg [2:0] count
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 3'b000;
        else
            count <= count + 1'b1;
    end
endmodule
