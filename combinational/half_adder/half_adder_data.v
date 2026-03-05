//DataFlow model for halfadder
module half_adder (
    input  a,      // Input bit A
    input  b,      // Input bit B
    output sum,    // Sum output
    output carry   // Carry output
);

    // Dataflow modeling
    assign sum   = a ^ b;  // XOR for sum
    assign carry = a & b;   // AND for carry

endmodule
