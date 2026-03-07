// Simple Testbench
module tb;
    reg clk;
    reg rst;
    reg up_down;
    reg enable;
    wire [3:0] count;
    
    // Instantiate counter
    updown_counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .enable(enable),
        .count(count)
    );
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Waveform dump for EDA Playground
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end
    
    // Simple test sequence
    initial begin
        // Initialize
        rst = 1;
        up_down = 1;  // Up counting mode
        enable = 0;
        
        #15;
        
        // Release reset and enable counter
        rst = 0;
        enable = 1;
        
        // Test up counting for 8 cycles
        $display("Up Counting:");
        #10;  // Wait 1 clock cycle
        $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        
        // Change to down counting
        up_down = 0;
        $display("\nDown Counting:");
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        #10;  $display("count = %d", count);
        
        // Test reset
        $display("\nApplying Reset:");
        rst = 1;
        #10;
        $display("After reset: count = %d", count);
        
        #20;
        $display("\nSimulation Complete");
        $finish;
    end

endmodule
