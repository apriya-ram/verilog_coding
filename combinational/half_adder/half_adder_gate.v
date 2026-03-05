//Gate level modelling

module half_adder_gate (
    input  a,
    input  b,
    output sum,
    output carry
);

    // Gate-level modeling
    xor (sum, a, b);    // XOR gate for sum
    and (carry, a, b);  // AND gate for carry

endmodule
