//2:1 mux code in data flow modelling

module mux2x1_dataflow (
    input a, b, sel,
    output y
);
    assign y = (~sel & a) | (sel & b);
    
endmodule
