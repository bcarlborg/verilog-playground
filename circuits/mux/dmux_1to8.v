// DEMULTIPLEXER 1 TO 8
// Demultiplexer with one input, eight outputs, and 3 selectors.
// When sel0 is 0 & sel1 is 0 & sel2 is 0, out0 is a.
// When sel0 is 1 & sel1 is 0 & sel2 is 0, out1 is a
// When sel0 is 0 & sel1 is 1 & sel2 is 0, out2 is a
// When sel0 is 1 & sel1 is 1 & sel2 is 0, out3 is a
// When sel0 is 0 & sel1 is 0 & sel2 is 1, out4 is a
// When sel0 is 1 & sel1 is 0 & sel2 is 1, out5 is a
// When sel0 is 0 & sel1 is 1 & sel2 is 1, out6 is a
// When sel0 is 1 & sel1 is 1 & sel2 is 1, out7 is a
module dmux_1to8(
  input in,
  input [2:0] sel,
  output [7:0] out
);
  assign out[0] = sel[2] ? 0 : (sel[1] ? 0 : (sel[0] ? 0 : in));
  assign out[1] = sel[2] ? 0 : (sel[1] ? 0 : (sel[0] ? in : 0));
  assign out[2] = sel[2] ? 0 : (sel[1] ? (sel[0] ? 0 : in) : 0);
  assign out[3] = sel[2] ? 0 : (sel[1] ? (sel[0] ? in : 0) : 0);
  assign out[4] = sel[2] ? (sel[1] ? 0 : (sel[0] ? 0 : in)) : 0;
  assign out[5] = sel[2] ? (sel[1] ? 0 : (sel[0] ? in : 0)) : 0;
  assign out[6] = sel[2] ? (sel[1] ? (sel[0] ? 0 : in) : 0) : 0;
  assign out[7] = sel[2] ? (sel[1] ? (sel[0] ? in : 0) : 0) : 0;
endmodule
