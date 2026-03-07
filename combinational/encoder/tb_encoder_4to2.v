// Testbench for 4-to-2 Encoder
module tb_encoder_4to2;
    reg [3:0] din;
    wire [1:0] dout;
    
    // Instantiate encoder
    encoder_4to2 uut (
        .din(din),
        .dout(dout)
    );
    
    // Waveform dump
    initial begin
        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0, tb_encoder_4to2);
    end
    
    // Test sequence
    initial begin
        $display("==================================");
        $display("4-to-2 Encoder Test");
        $display("==================================");
        $display("din\t| dout");
        $display("------------------");
        
        // Test all valid inputs
        din = 4'b0001; #10;
        $display("%b\t| %b", din, dout);
        
        din = 4'b0010; #10;
        $display("%b\t| %b", din, dout);
        
        din = 4'b0100; #10;
        $display("%b\t| %b", din, dout);
        
        din = 4'b1000; #10;
        $display("%b\t| %b", din, dout);
        
        // Test invalid inputs
        din = 4'b0000; #10;
        $display("\nInvalid Inputs:");
        $display("%b\t| %b (no input)", din, dout);
        
        din = 4'b0011; #10;
        $display("%b\t| %b (multiple bits)", din, dout);
        
        din = 4'b0101; #10;
        $display("%b\t| %b (multiple bits)", din, dout);
        
        din = 4'b1111; #10;
        $display("%b\t| %b (multiple bits)", din, dout);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
