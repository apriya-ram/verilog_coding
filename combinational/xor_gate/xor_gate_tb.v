//testbench for xor gate
module xor_gate_tb;

    // Signals
    reg  a;
    reg  b;
    wire y;

    // Instantiate the DUT (Device Under Test)
    // You can use either module - uncomment the one you want to test
    xor_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );
    
    /*
    // Alternative module instantiation
    xor_gate_beh uut (
        .a(a),
        .b(b),
        .y(y)
    );
    */

    // Testbench code
    initial begin
        // Display header
        $display("XOR Gate Testbench");
        $display("------------------");
        $display(" a b | y");
        $display("-----|---");
        
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        $display(" %0d %0d | %0d", a, b, y);
        
        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        $display(" %0d %0d | %0d", a, b, y);
        
        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        $display(" %0d %0d | %0d", a, b, y);
        
        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        $display(" %0d %0d | %0d", a, b, y);
        
        // Test case 5: Random values (multiple tests)
        repeat(5) begin
            a = $random % 2;
            b = $random % 2;
            #10;
            $display(" %0d %0d | %0d", a, b, y);
        end
        
        // End simulation
        $display("------------------");
        $display("Test completed");
        $finish;
    end

endmodule
