// BCD to Decimal Encoder (4-to-10)
module bcd_to_decimal (
    input [3:0] bcd_in,      // BCD input (0-9)
    output reg [9:0] decimal_out // 10-bit one-hot output
);

    always @(*) begin
        case (bcd_in)
            4'b0000: decimal_out = 10'b0000000001;
            4'b0001: decimal_out = 10'b0000000010;
            4'b0010: decimal_out = 10'b0000000100;
            4'b0011: decimal_out = 10'b0000001000;
            4'b0100: decimal_out = 10'b0000010000;
            4'b0101: decimal_out = 10'b0000100000;
            4'b0110: decimal_out = 10'b0001000000;
            4'b0111: decimal_out = 10'b0010000000;
            4'b1000: decimal_out = 10'b0100000000;
            4'b1001: decimal_out = 10'b1000000000;
            default: decimal_out = 10'b0000000000; // Invalid BCD
        endcase
    end

endmodule
