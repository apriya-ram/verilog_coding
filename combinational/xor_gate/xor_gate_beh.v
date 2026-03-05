//Xor gate a different version

module xor_gate_beh (
    input  a,
    input  b,
    output reg y
);

    always @(*) begin
        if (a != b)
            y = 1'b1;
        else
            y = 1'b0;
    end

endmodule
