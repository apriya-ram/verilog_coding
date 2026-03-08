// Simplified Testbench for 1011 Pattern Detector
module tb_simple;
    reg clk;
    reg rst;
    reg din;
    wire dout;
    
    // Instantiate Mealy machine
    pattern_detector_1011_mealy uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("simple.vcd");
        $dumpvars(0, tb_simple);
    end
    
    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        din = 0;
        #15;
        
        rst = 0;
        
        $display("Testing 1011 Pattern Detector");
        $display("Input Stream: 1 0 1 1 0 1 1");
        $display("---------------------------");
        
        // Send test pattern: 1 0 1 1 0 1 1
        #10 din = 1;  // Bit 1
        #10 din = 0;  // Bit 2
        #10 din = 1;  // Bit 3
        #10 din = 1;  // Bit 4 -> Pattern detected
        #10 din = 0;  // Bit 5
        #10 din = 1;  // Bit 6
        #10 din = 1;  // Bit 7 -> Pattern detected again
        
        #20;
        $display("---------------------------");
        $display("Test Complete");
        $finish;
    end
    
    // Monitor
    initial begin
        $monitor("Time = %0t, din = %b, dout = %b", $time, din, dout);
    end
endmodule
