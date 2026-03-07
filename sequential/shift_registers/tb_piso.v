// Testbench for PISO Shift Register
module tb_piso;
    reg clk;
    reg rst;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;
    
    // Instantiate PISO
    piso_shiftreg #(4) uut (
        .clk(clk),
        .rst(rst),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("piso.vcd");
        $dumpvars(0, tb_piso);
    end
    
    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        load = 0;
        parallel_in = 0;
        
        $display("==================================");
        $display("PISO Shift Register Test");
        $display("==================================");
        $display("Time\tRST\tLoad\tParallel In\tSerial Out");
        $display("----------------------------------");
        
        #15;
        rst = 0;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        // Load data 1010
        $display("\nLoading data: 1010");
        @(posedge clk);
        load = 1;
        parallel_in = 4'b1010;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Data Loaded", $time, rst, load, parallel_in, serial_out);
        
        // Shift out data
        @(posedge clk);
        load = 0;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - MSB out", $time, rst, load, parallel_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - LSB out", $time, rst, load, parallel_in, serial_out);
        
        // Load another data 1100
        $display("\nLoading data: 1100");
        @(posedge clk);
        load = 1;
        parallel_in = 4'b1100;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Data Loaded", $time, rst, load, parallel_in, serial_out);
        
        // Shift out data
        @(posedge clk);
        load = 0;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, load, parallel_in, serial_out);
        
        // Test reset
        $display("\nTesting Reset:");
        @(posedge clk);
        rst = 1;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Reset Applied", $time, rst, load, parallel_in, serial_out);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
