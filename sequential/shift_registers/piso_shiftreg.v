// PISO Shift Register
module piso_shiftreg #(parameter WIDTH = 4) (
    input clk,
    input rst,
    input load,
    input [WIDTH-1:0] parallel_in,
    output reg serial_out
);
    reg [WIDTH-1:0] shift_reg;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 0;
            serial_out <= 0;
        end
        else if (load)
            shift_reg <= parallel_in;  // Load parallel data
        else begin
            serial_out <= shift_reg[WIDTH-1];  // Output MSB
            shift_reg <= {shift_reg[WIDTH-2:0], 1'b0};  // Shift left
        end
    end
endmodule
