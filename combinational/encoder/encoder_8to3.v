// 8-to-3 Encoder
module encoder_8to3 (
    input [7:0] din,    // 8-bit input
    output reg [2:0] dout // 3-bit encoded output
);

    always @(*) begin
        case (din)
            8'b00000001: dout = 3'b000;
            8'b00000010: dout = 3'b001;
            8'b00000100: dout = 3'b010;
            8'b00001000: dout = 3'b011;
            8'b00010000: dout = 3'b100;
            8'b00100000: dout = 3'b101;
            8'b01000000: dout = 3'b110;
            8'b10000000: dout = 3'b111;
            default: dout = 3'b000;
        endcase
    end

endmodule
