// Testbench for 3-bit synchronous counter
module tb_counter_3bit;
    // Testbench signals
    reg clk;
    reg rst;
    wire [2:0] count;
    
    // Instantiate the counter (using behavioral style)
    counter_3bit_behavioral uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock cycle
    end
    
    // Test stimulus
    initial begin
        // Initialize VCD file for waveform viewing (for EDA Playground)
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_counter_3bit);
        
        // Display header
        $display("==========================================");
        $display("Testing 3-bit Synchronous Counter");
        $display("==========================================");
        $display("Time\tRST\tCLK\tCount");
        $display("------------------------------------------");
        
        // Initial state with reset
        rst = 1;  // Apply reset
        #10;
        
        // Display after first reset
        $display("%0t\t%b\t%b\t%b", $time, rst, clk, count);
        
        // Release reset and let counter run
        rst = 0;
        $display("%0t\t%b\t%b\t%b", $time, rst, clk, count);
        
        // Run for 8 clock cycles (complete one full cycle 0-7)
        repeat(8) begin
            @(posedge clk);
            #1;  // Small delay for stable display
            $display("%0t\t%b\t%b\t%b", $time, rst, clk, count);
        end
        
        // Test reset during operation
        @(negedge clk);
        rst = 1;  // Assert reset
        $display("%0t\t%b\t%b\t%b - Reset Applied", $time, rst, clk, count);
        #10;
        
        // Release reset again
        rst = 0;
        $display("%0t\t%b\t%b\t%b - Reset Released", $time, rst, clk, count);
        
        // Run for a few more cycles
        repeat(4) begin
            @(posedge clk);
            #1;
            $display("%0t\t%b\t%b\t%b", $time, rst, clk, count);
        end
        
        // Finish simulation
        #20;
        $display("==========================================");
        $display("Simulation Complete");
        $display("==========================================");
        
        $finish;
    end
    
    // Monitor changes automatically
    initial begin
        $monitor("Time = %0t, rst = %b, clk = %b, count = %b", 
                  $time, rst, clk, count);
    end

endmodule
