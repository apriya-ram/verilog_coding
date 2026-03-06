//2:1 mux with ternary operator
module mux2x1_conditional (
    input a, b, sel,
    output y
);
    assign y = sel ? b : a;
    
endmodule
