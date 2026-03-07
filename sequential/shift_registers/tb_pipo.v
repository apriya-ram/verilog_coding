// Testbench for PIPO Shift Register
module tb_pipo;
    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;
    
    // Instantiate PIPO
    pipo_shiftreg #(4) uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("pipo.vcd");
        $dumpvars(0, tb_pipo);
    end
    
    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        load = 0;
        parallel_in = 0;
        
        $display("==================================");
        $display("PIPO Shift Register Test");
        $display("==================================");
        $display("Time\tRST\tLoad\tParallel In\tParallel Out");
        $display("----------------------------------");
        
        #15;
        rst = 0;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, parallel_out);
        
        // Load first data
        $display("\nLoading data: 1010");
        @(posedge clk);
        load = 1;
        parallel_in = 4'b1010;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Data Loaded", $time, rst, load, parallel_in, parallel_out);
        
        // Hold the value
        @(posedge clk);
        load = 0;
        parallel_in = 4'b1111;  // Change input but shouldn't affect output
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Output should still be 1010", $time, rst, load, parallel_in, parallel_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, parallel_out);
        
        // Load second data
        $display("\nLoading data: 1100");
        @(posedge clk);
        load = 1;
        parallel_in = 4'b1100;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Data Loaded", $time, rst, load, parallel_in, parallel_out);
        
        // Hold again
        @(posedge clk);
        load = 0;
        parallel_in = 4'b1010;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Output should still be 1100", $time, rst, load, parallel_in, parallel_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, parallel_out);
        
        // Test reset
        $display("\nTesting Reset:");
        @(posedge clk);
        rst = 1;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Reset Applied", $time, rst, load, parallel_in, parallel_out);
        
        @(posedge clk);
        rst = 0;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Reset Released", $time, rst, load, parallel_in, parallel_out);
        
        // Load after reset
        $display("\nLoading after reset: 0110");
        @(posedge clk);
        load = 1;
        parallel_in = 4'b0110;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Data Loaded", $time, rst, load, parallel_in, parallel_out);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
