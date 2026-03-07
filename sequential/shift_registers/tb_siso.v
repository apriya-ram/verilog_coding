// Testbench for SISO Shift Register
module tb_siso;
    reg clk;
    reg rst;
    reg serial_in;
    wire serial_out;
    
    // Instantiate SISO
    siso_shiftreg #(4) uut (
        .clk(clk),
        .rst(rst),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Waveform dump
    initial begin
        $dumpfile("siso.vcd");
        $dumpvars(0, tb_siso);
    end
    
    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        serial_in = 0;
        
        $display("==================================");
        $display("SISO Shift Register Test");
        $display("==================================");
        $display("Time\tRST\tCLK\tSerial In\tSerial Out");
        $display("----------------------------------");
        
        #15;
        rst = 0;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        // Send data 1010 (MSB first)
        $display("\nSending data: 1 0 1 0");
        
        // Bit 3 (MSB)
        @(posedge clk);
        serial_in = 1;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        // Bit 2
        @(posedge clk);
        serial_in = 0;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        // Bit 1
        @(posedge clk);
        serial_in = 1;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        // Bit 0 (LSB)
        @(posedge clk);
        serial_in = 0;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        // Shift out remaining bits
        @(posedge clk);
        serial_in = 0;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        @(posedge clk);
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b", $time, rst, clk, serial_in, serial_out);
        
        // Test reset
        $display("\nTesting Reset:");
        @(posedge clk);
        rst = 1;
        #1;
        $display("%0t\t%b\t%b\t%b\t\t%b - Reset Applied", $time, rst, clk, serial_in, serial_out);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
