module tb_dff_async_reset_low;
    // Testbench signals
    reg d;
    reg clk;
    reg rst_n;
    wire q;
    
    // Instantiate the DUT (Device Under Test)
    dff_async_reset_low uut (
        .d(d),
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );
    
    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock cycle
    end
    
    // Test stimulus
    initial begin
        // Initialize signals
        d = 0;
        rst_n = 0;  // Start with reset asserted (active low)
        
        // Wait for a few clock cycles with reset active
        #15;
        
        // Release reset
        rst_n = 1;
        
        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        
        // Test reset during operation
        #5  rst_n = 0;  // Assert reset (active low)
        #10 d = 1;      // Try to change d while reset is active
        #10 d = 0;
        #10 rst_n = 1;  // Release reset
        
        // Continue normal operation
        #10 d = 1;
        #10 d = 0;
        
        #20 $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time = %0t, rst_n = %b, clk = %b, d = %b, q = %b", 
                  $time, rst_n, clk, d, q);
    end

endmodule
