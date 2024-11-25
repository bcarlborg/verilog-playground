module mux16_8to1(
    input [15:0] a, b, c, d, e, f, g, h,
    input [2:0] sel,
    output [15:0] out
);
    assign out = sel[2] ? (sel[1] ? (sel[0] ? h : g) : (sel[0] ? f : e)) : (sel[1] ? (sel[0] ? d : c) : (sel[0] ? b : a));
endmodule