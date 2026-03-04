//This is a test bench for an and gate 
module tb_and_gate;

  reg a, b;
  wire y;

  // Instantiate AND gate
  and_gate uut (
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    $display("a b | y");
    $display("----+--");
    
    a = 0; b = 0; #10;
    $display("%b %b | %b", a, b, y);
    
    a = 0; b = 1; #10;
    $display("%b %b | %b", a, b, y);
    
    a = 1; b = 0; #10;
    $display("%b %b | %b", a, b, y);
    
    a = 1; b = 1; #10;
    $display("%b %b | %b", a, b, y);
    
    $finish;
  end

endmodule

