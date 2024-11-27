`ifndef MUX16_4TO1_V
`define MUX16_4TO1_V

module mux16_4to1(
    input [15:0] in0, in1, in2, in3,
    input [1:0] sel,
    output [15:0] out
);
    assign out = sel[1] ? (sel[0] ? in3 : in2) : (sel[0] ? in1 : in0);
endmodule

`endif
