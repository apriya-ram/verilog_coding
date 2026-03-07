// 4-to-2 Priority Encoder
module priority_encoder_4to2 (
    input [3:0] din,        // 4-bit input
    output reg [1:0] dout,  // 2-bit encoded output
    output reg valid        // Valid output indicator
);

    always @(*) begin
        casex (din)
            4'b1xxx: begin dout = 2'b11; valid = 1; end  // Highest priority
            4'b01xx: begin dout = 2'b10; valid = 1; end
            4'b001x: begin dout = 2'b01; valid = 1; end
            4'b0001: begin dout = 2'b00; valid = 1; end
            default: begin dout = 2'b00; valid = 0; end  // No valid input
        endcase
    end

endmodule
