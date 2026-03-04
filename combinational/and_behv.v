//This file is created by Priya Ananthakrishnan
module and_gate (
  input  a,
  input  b,
  output reg y
);

  always @(*) begin
    y = a & b;
  end

endmodule
