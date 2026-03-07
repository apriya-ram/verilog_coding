// Testbench for BCD to Decimal Encoder
module tb_bcd_to_decimal;
    reg [3:0] bcd_in;
    wire [9:0] decimal_out;
    integer i;
    
    // Instantiate encoder
    bcd_to_decimal uut (
        .bcd_in(bcd_in),
        .decimal_out(decimal_out)
    );
    
    // Waveform dump
    initial begin
        $dumpfile("bcd_to_decimal.vcd");
        $dumpvars(0, tb_bcd_to_decimal);
    end
    
    // Test sequence
    initial begin
        $display("==================================");
        $display("BCD to Decimal Encoder Test");
        $display("==================================");
        $display("BCD\t| Decimal Output");
        $display("------------------------");
        
        // Test all valid BCD inputs (0-9)
        for (i = 0; i < 10; i = i + 1) begin
            bcd_in = i;
            #10;
            $display("%b\t| %b", bcd_in, decimal_out);
        end
        
        // Test invalid BCD inputs (10-15)
        $display("\nInvalid BCD Inputs:");
        for (i = 10; i < 16; i = i + 1) begin
            bcd_in = i;
            #10;
            $display("%b\t| %b (invalid)", bcd_in, decimal_out);
        end
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
