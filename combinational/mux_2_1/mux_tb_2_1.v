//testbench for the module mux
module tb_mux2x1;
    reg a, b, sel;
    wire y;
    
    // Instantiate the MUX (using conditional style)
    mux2x1_conditional uut (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );
    
    initial begin
        // Monitor changes
        $monitor("Time = %0t, sel = %b, a = %b, b = %b, y = %b", 
                  $time, sel, a, b, y);
        
        // Test all combinations
        a = 0; b = 0; sel = 0; #10;
        a = 0; b = 1; sel = 0; #10;
        a = 1; b = 0; sel = 0; #10;
        a = 1; b = 1; sel = 0; #10;
        
        a = 0; b = 0; sel = 1; #10;
        a = 0; b = 1; sel = 1; #10;
        a = 1; b = 0; sel = 1; #10;
        a = 1; b = 1; sel = 1; #10;
        
        $finish;
    end
    
endmodule
