// Testbench for 4-to-2 Priority Encoder
module tb_priority_encoder;
    reg [3:0] din;
    wire [1:0] dout;
    wire valid;
    
    // Instantiate priority encoder
    priority_encoder_4to2 uut (
        .din(din),
        .dout(dout),
        .valid(valid)
    );
    
    // Waveform dump
    initial begin
        $dumpfile("priority_encoder.vcd");
        $dumpvars(0, tb_priority_encoder);
    end
    
    // Test sequence
    initial begin
        $display("==================================");
        $display("4-to-2 Priority Encoder Test");
        $display("==================================");
        $display("din\t| dout\t| valid");
        $display("----------------------------");
        
        // Test priority order
        din = 4'b1000; #10;
        $display("%b\t| %b\t| %b", din, dout, valid);
        
        din = 4'b1100; #10;  // Multiple bits - should output highest priority
        $display("%b\t| %b\t| %b (bits 3 and 2)", din, dout, valid);
        
        din = 4'b1010; #10;  // Multiple bits
        $display("%b\t| %b\t| %b (bits 3 and 1)", din, dout, valid);
        
        din = 4'b0111; #10;  // Multiple bits
        $display("%b\t| %b\t| %b (bits 2,1,0)", din, dout, valid);
        
        din = 4'b0010; #10;
        $display("%b\t| %b\t| %b", din, dout, valid);
        
        din = 4'b0001; #10;
        $display("%b\t| %b\t| %b", din, dout, valid);
        
        din = 4'b0000; #10;
        $display("%b\t| %b\t| %b (no input)", din, dout, valid);
        
        din = 4'b0100; #10;
        $display("%b\t| %b\t| %b", din, dout, valid);
        
        #10;
        $display("\nSimulation Complete");
        $finish;
    end
endmodule
