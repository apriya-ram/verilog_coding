// Testbench for 1011 Pattern Detector
module tb_pattern_detector;
    reg clk;
    reg rst;
    reg din;
    wire dout_mealy;
    wire dout_moore;
    
    // Instantiate both Mealy and Moore machines
    pattern_detector_1011_mealy mealy_uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout_mealy)
    );
    
    pattern_detector_1011_moore moore_uut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .dout(dout_moore)
    );
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Waveform dump for EDA Playground
    initial begin
        $dumpfile("pattern_detector.vcd");
        $dumpvars(0, tb_pattern_detector);
    end
    
    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        din = 0;
        
        $display("==========================================");
        $display("1011 Pattern Detector Testbench");
        $display("==========================================");
        $display("Time\tRST\tCLK\tDin\tMealy Out\tMoore Out");
        $display("------------------------------------------");
        
        #15;
        rst = 0;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        // Test Case 1: Pattern "1011" in continuous stream
        $display("\n--- Test 1: Pattern '1011' ---");
        // Send: 1 0 1 1
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;  // Pattern detected here
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b (PATTERN DETECTED)", $time, rst, clk, din, dout_mealy, dout_moore);
        
        // Test Case 2: Overlapping pattern "1011011"
        $display("\n--- Test 2: Overlapping Pattern '1011011' ---");
        // Send: 1 0 1 1 0 1 1
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;  // First detection
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b (1st DETECTION)", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;  // Second detection
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b (2nd DETECTION)", $time, rst, clk, din, dout_mealy, dout_moore);
        
        // Test Case 3: Pattern with reset in between
        $display("\n--- Test 3: Reset during pattern ---");
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        // Apply reset
        @(negedge clk); rst = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b (RESET)", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        rst = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b (RESET RELEASED)", $time, rst, clk, din, dout_mealy, dout_moore);
        
        // Test Case 4: No pattern
        $display("\n--- Test 4: No pattern '110010' ---");
        // Send: 1 1 0 0 1 0
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 1; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        @(posedge clk); din = 0; #1;
        $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        
        // Test Case 5: Multiple patterns
        $display("\n--- Test 5: Multiple patterns '1011 1011' ---");
        // Send: 1 0 1 1 1 0 1 1
        repeat(8) begin
            @(posedge clk);
            if ($time == 385) din = 1;
            else if ($time == 395) din = 0;
            else if ($time == 405) din = 1;
            else if ($time == 415) din = 1;
            else if ($time == 425) din = 1;
            else if ($time == 435) din = 0;
            else if ($time == 445) din = 1;
            else if ($time == 455) din = 1;
            #1;
            $display("%0t\t%b\t%b\t%b\t%b\t\t%b", $time, rst, clk, din, dout_mealy, dout_moore);
        end
        
        #20;
        $display("\n==========================================");
        $display("Simulation Complete");
        $display("==========================================");
        
        $finish;
    end

endmodule
