// Testbench for 8-to-3 Encoder
module tb_encoder_8to3;
    reg [7:0] din;
    wire [2:0] dout;
    integer i;
    
    // Instantiate encoder
    encoder_8to3 uut (
        .din(din),
        .dout(dout)
    );
    
    // Waveform dump
    initial begin
        $dumpfile("encoder_8to3.vcd");
        $dumpvars(0, tb_encoder_8to3);
    end
    
    // Test sequence
    initial begin
        $display("==================================");
        $display("8-to-3 Encoder Test");
        $display("==================================");
        $display("din\t\t| dout");
        $display("----------------------------");
        
        // Test all valid inputs using loop
        for (i = 0; i < 8; i = i + 1) begin
            din = 1 << i;  // Set bit i to 1
            #10;
            $display("%b | %b", din, dout);
        end
        
        // Test invalid inputs
        $display("\nInvalid Inputs:");
        din = 8'b00000000; #10;
        $display("%b | %b (no input)", din, dout);
        
        din = 8'b00000101; #10;
        $display("%b | %b (multiple bits)", din, dout);
        
        din = 8'b10000001; #10;
        $display("%b | %b (multiple bits)", din, dout);
        
        din = 8'b11111111; #10;
        $display("%b | %b (all bits)", din, dout);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
