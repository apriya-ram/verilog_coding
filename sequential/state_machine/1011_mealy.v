// 1011 Pattern Detector - Mealy Machine
// Output is 1 when pattern "1011" is detected
module pattern_detector_1011_mealy (
    input clk,
    input rst,
    input din,           // Serial input
    output reg dout      // Output (1 when pattern detected)
);

    // State encoding
    parameter S0 = 3'b000,  // No matching input
              S1 = 3'b001,  // '1' detected
              S2 = 3'b010,  // '10' detected
              S3 = 3'b011;  // '101' detected
    
    reg [2:0] state, next_state;

    // State register
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    // Next state and output logic (Mealy - output depends on state and input)
    always @(*) begin
        next_state = state;
        dout = 1'b0;
        
        case (state)
            S0: begin
                if (din == 1'b1)
                    next_state = S1;
                else
                    next_state = S0;
            end
            
            S1: begin  // Detected '1'
                if (din == 1'b0)
                    next_state = S2;  // '10' detected
                else
                    next_state = S1;  // Still '1'
            end
            
            S2: begin  // Detected '10'
                if (din == 1'b1)
                    next_state = S3;  // '101' detected
                else
                    next_state = S0;  // Restart
            end
            
            S3: begin  // Detected '101'
                if (din == 1'b1) begin
                    next_state = S1;  // '1011' detected, start new pattern from last '1'
                    dout = 1'b1;      // Output 1 when pattern detected
                end
                else begin
                    next_state = S2;  // '1010' -> last two bits '10'
                end
            end
            
            default: next_state = S0;
        endcase
    end

endmodule
