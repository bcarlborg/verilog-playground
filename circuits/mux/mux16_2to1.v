module mux16_2to1(
    input [15:0] a, b,
    input [3:0] sel,
    output [15:0] out
);
    assign out = sel ? b : a;
endmodule