module tb_dff_async_reset_low;
    // Testbench signals
    reg d;
    reg clk;
    reg rst_n;
    wire q;
    
    // Instantiate the DUT
    dff_async_reset_low uut (
        .d(d),
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end
    
    // Test stimulus
    initial begin
        // Initialize signals
        d = 0;
        rst_n = 0;  // Reset active (low)
        
        // Display header
        $display("========================================");
        $display("Testing D Flip-Flop with Active Low Reset");
        $display("========================================");
        $display("Time\trst_n\tclk\td\tq");
        $display("----------------------------------------");
        
        // Wait for 2 clock cycles with reset active
        #20;
        
        // Release reset
        rst_n = 1;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        // Apply test patterns
        @(posedge clk); #1 d = 1;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        @(posedge clk); #1 d = 0;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        @(posedge clk); #1 d = 1;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        // Test asynchronous reset during operation
        @(negedge clk); #1 rst_n = 0;  // Assert reset (active low)
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        #10 d = 0;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        #10 rst_n = 1;  // Release reset
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        // Continue normal operation
        @(posedge clk); #1 d = 1;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        @(posedge clk); #1 d = 0;
        $display("%0t\t%b\t%b\t%b\t%b", $time, rst_n, clk, d, q);
        
        // Finish simulation
        #20;
        $display("========================================");
        $display("Simulation Complete");
        $display("========================================");
        
        // Generate waveform (for EDA Playground)
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_dff_async_reset_low);
        
        $finish;
    end
    
    // Optional: Monitor changes automatically
    initial begin
        $monitor("Time = %0t, rst_n = %b, clk = %b, d = %b, q = %b", 
                  $time, rst_n, clk, d, q);
    end

endmodule
