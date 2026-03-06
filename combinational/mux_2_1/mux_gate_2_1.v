// This file explains the 2:1 mux verilog coding gate level model
module mux2x1_gate (
    input a,        // Input 0
    input b,        // Input 1
    input sel,      // Select line
    output y        // Output
);
    wire sel_bar, w1, w2;
    
    not (sel_bar, sel);
    and (w1, a, sel_bar);
    and (w2, b, sel);
    or (y, w1, w2);
    
endmodule
