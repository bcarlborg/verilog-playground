module mux16_8to1(
    input [15:0] in0, in1, in2, in3, in4, in5, in6, in7,
    input [2:0] sel,
    output [15:0] out
);
    assign out = sel[2] ? (sel[1] ? (sel[0] ? in7 : in6) : (sel[0] ? in5 : in4)) : (sel[1] ? (sel[0] ? in3 : in2) : (sel[0] ? in1 : in0));
endmodule
