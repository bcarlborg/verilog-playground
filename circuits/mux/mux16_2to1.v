module mux16_2to1(
    input [15:0] in_0, in_1, 
    input sel,
    output [15:0] out
);
    assign out = sel ? in_1 : in_0;
endmodule
