// Testbench for Mod-10 Counter
module tb_mod10_counter;
    // Testbench signals
    reg clk;
    reg rst;
    reg enable;
    wire [3:0] count;
    
    // Instantiate the Mod-10 counter
    mod10_counter uut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock cycle
    end
    
    // Waveform dump for EDA Playground
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mod10_counter);
    end
    
    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        enable = 0;
        
        // Display header
        $display("========================================");
        $display("Mod-10 Counter Testbench");
        $display("========================================");
        $display("Time\tRST\tEN\tCount");
        $display("----------------------------------------");
        
        // Apply reset for 15ns
        #15;
        $display("%0t\t%b\t%b\t%d", $time, rst, enable, count);
        
        // Release reset and enable counter
        rst = 0;
        enable = 1;
        $display("%0t\t%b\t%b\t%d - Reset Released", $time, rst, enable, count);
        
        // Count from 0 to 9 and repeat for 2 full cycles
        $display("\n--- Counting from 0 to 9 (2 cycles) ---");
        repeat(20) begin  // 20 clock cycles = 2 full cycles (0-9 twice)
            @(posedge clk);
            #1;  // Small delay for stable display
            $display("%0t\t%b\t%b\t%d", $time, rst, enable, count);
        end
        
        // Test enable functionality
        $display("\n--- Testing Enable Functionality ---");
        enable = 0;  // Disable counter
        $display("%0t\t%b\t%b\t%d - Counter Disabled", $time, rst, enable, count);
        
        #30;  // Wait for 3 clock cycles
        $display("%0t\t%b\t%b\t%d - Count should be unchanged", $time, rst, enable, count);
        
        enable = 1;  // Enable counter again
        $display("%0t\t%b\t%b\t%d - Counter Enabled", $time, rst, enable, count);
        
        // Count for a few more cycles
        repeat(5) begin
            @(posedge clk);
            #1;
            $display("%0t\t%b\t%b\t%d", $time, rst, enable, count);
        end
        
        // Test reset during operation
        $display("\n--- Testing Reset Functionality ---");
        @(negedge clk);
        rst = 1;  // Assert reset
        $display("%0t\t%b\t%b\t%d - Reset Applied", $time, rst, enable, count);
        #10;
        
        rst = 0;  // Release reset
        $display("%0t\t%b\t%b\t%d - Reset Released", $time, rst, enable, count);
        
        // Count again
        repeat(5) begin
            @(posedge clk);
            #1;
            $display("%0t\t%b\t%b\t%d", $time, rst, enable, count);
        end
        
        // Test boundary condition (9 to 0 rollover)
        $display("\n--- Testing Rollover (9 to 0) ---");
        
        // Manually set count to 8 (for demonstration)
        // Note: This is just for simulation, not synthesizable
        force uut.count = 4'b1000;  // Force count to 8
        #10;
        release uut.count;
        
        $display("Starting from 8:");
        repeat(4) begin  // Should see 8,9,0,1
            @(posedge clk);
            #1;
            $display("%0t\t%b\t%b\t%d", $time, rst, enable, count);
        end
        
        // Complete the simulation
        #20;
        $display("\n========================================");
        $display("Simulation Complete");
        $display("========================================");
        
        $finish;
    end
    
    // Monitor for automatic display
    initial begin
        $monitor("Time = %0t, rst = %b, enable = %b, count = %d", 
                  $time, rst, enable, count);
    end

endmodule
