// Testbench for 8-to-3 Priority Encoder
module tb_priority_encoder_8to3;
    reg [7:0] din;
    wire [2:0] dout;
    wire valid;
    
    // Instantiate priority encoder
    priority_encoder_8to3 uut (
        .din(din),
        .dout(dout),
        .valid(valid)
    );
    
    // Waveform dump
    initial begin
        $dumpfile("priority_encoder_8to3.vcd");
        $dumpvars(0, tb_priority_encoder_8to3);
    end
    
    // Test sequence
    initial begin
        $display("==================================");
        $display("8-to-3 Priority Encoder Test");
        $display("==================================");
        $display("din\t\t| dout\t| valid");
        $display("--------------------------------");
        
        // Test single bits
        din = 8'b00000001; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b00000010; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b00000100; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b00001000; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b00010000; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b00100000; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b01000000; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        din = 8'b10000000; #10;
        $display("%b | %b\t| %b", din, dout, valid);
        
        // Test multiple bits (priority)
        $display("\nMultiple Bits (Priority Test):");
        din = 8'b10000001; #10;
        $display("%b | %b\t| %b (bits 7 and 0)", din, dout, valid);
        
        din = 8'b01010000; #10;
        $display("%b | %b\t| %b (bits 6 and 4)", din, dout, valid);
        
        din = 8'b00101000; #10;
        $display("%b | %b\t| %b (bits 5 and 3)", din, dout, valid);
        
        din = 8'b11111111; #10;
        $display("%b | %b\t| %b (all bits)", din, dout, valid);
        
        // Test no input
        din = 8'b00000000; #10;
        $display("%b | %b\t| %b (no input)", din, dout, valid);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
