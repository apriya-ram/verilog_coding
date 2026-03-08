// 1011 Pattern Detector - Moore Machine
// Output is 1 when in state that indicates pattern "1011" is detected
module pattern_detector_1011_moore (
    input clk,
    input rst,
    input din,
    output reg dout
);

    // State encoding
    parameter S0 = 3'b000,  // No match
              S1 = 3'b001,  // '1'
              S2 = 3'b010,  // '10'
              S3 = 3'b011,  // '101'
              S4 = 3'b100;  // '1011' (PATTERN DETECTED)
    
    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            S0: next_state = (din == 1'b1) ? S1 : S0;
            S1: next_state = (din == 1'b0) ? S2 : S1;
            S2: next_state = (din == 1'b1) ? S3 : S0;
            S3: next_state = (din == 1'b1) ? S4 : S2;
            S4: next_state = (din == 1'b1) ? S1 : S2;
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore - output depends only on state)
    always @(*) begin
        dout = (state == S4) ? 1'b1 : 1'b0;
    end

endmodule
