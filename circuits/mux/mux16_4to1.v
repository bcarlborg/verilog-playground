module mux16_4to1(
    input [15:0] a, b, c, d,
    input [1:0] sel,
    output [15:0] out
);
    assign out = sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a);
endmodule