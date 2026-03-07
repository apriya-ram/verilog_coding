// Testbench
module tb;
    reg a, b;
    wire y;
    
    // Instantiate OR gate
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );
    
    // Waveform dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end
    
    // Test sequence
    initial begin
        $display("OR Gate Test");
        $display("-----------");
        
        // Test all combinations
        a = 0; b = 0; #10;
        $display("%b | %b = %b", a, b, y);
        
        a = 0; b = 1; #10;
        $display("%b | %b = %b", a, b, y);
        
        a = 1; b = 0; #10;
        $display("%b | %b = %b", a, b, y);
        
        a = 1; b = 1; #10;
        $display("%b | %b = %b", a, b, y);
        
        #10;
        $display("-----------");
        $display("Test Complete");
        $finish;
    end
endmodule
