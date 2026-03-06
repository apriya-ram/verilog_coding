module tb_dff_async_reset;
    reg d, clk, rst;
    wire q;
    
    // Instantiate the DFF
    dff_async_reset uut (
        .d(d),
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    initial begin
        // Initialize
        clk = 0;
        d = 0;
        rst = 0;
        
        // Monitor
        $monitor("Time = %0t, rst = %b, clk = %b, d = %b, q = %b", 
                  $time, rst, clk, d, q);
        
        // Test normal operation
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        
        // Test asynchronous reset during normal operation
        #10 rst = 1;  // Assert reset (should reset immediately)
        #10 rst = 0;  // De-assert reset
        #10 d = 1;
        #10 d = 0;
        
        // Test reset during clock edge
        #10 d = 1;
        #5 rst = 1;   // Assert reset in middle of clock cycle
        #10 rst = 0;
        
        #20 $finish;
    end

endmodule
