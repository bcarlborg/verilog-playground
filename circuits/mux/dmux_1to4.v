// DEMULTIPLEXER 1 TO 4
// Demultiplexer with one input, four outputs, and 2 selectors.
// when sel0:0 & sel1:0, out0 is a.
// when sel0:1 & sel1:0, out1 is a.
// when sel0:0 & sel1:1, out2 is a.
// when sel0:1 & sel1:1, out3 is a.
module dmux_1to4(
  input in,
  input [1:0] sel,
  output [3:0] out
);
  assign out[0] = sel[1] ? 0 : (sel[0] ? 0 : in);
  assign out[1] = sel[1] ? 0 : (sel[0] ? in : 0);
  assign out[2] = sel[1] ? (sel[0] ? 0 : in) : 0;
  assign out[3] = sel[1] ? (sel[0] ? in : 0) : 0;
endmodule
