//testbench for the half adder

module half_adder_tb;

    // Signals
    reg  a;
    reg  b;
    wire sum;
    wire carry;

    // Instantiate the DUT (Device Under Test)
    // You can use any of the three modules
    half_adder uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    // Testbench code
    initial begin
        $display("========================================");
        $display("Half Adder Testbench");
        $display("========================================");
        $display(" A B | Sum Carry");
        $display("-----|----------");
        
        // Test case 1: 0 + 0
        a = 0; b = 0;
        #10;
        $display(" %0d %0d |  %0d    %0d", a, b, sum, carry);
        
        // Test case 2: 0 + 1
        a = 0; b = 1;
        #10;
        $display(" %0d %0d |  %0d    %0d", a, b, sum, carry);
        
        // Test case 3: 1 + 0
        a = 1; b = 0;
        #10;
        $display(" %0d %0d |  %0d    %0d", a, b, sum, carry);
        
        // Test case 4: 1 + 1
        a = 1; b = 1;
        #10;
        $display(" %0d %0d |  %0d    %0d", a, b, sum, carry);
        
        $display("========================================");
        $finish;
    end

endmodule
