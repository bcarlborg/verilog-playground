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
  input sel0,
  input sel1,
  input sel2,
  output out0,
  output out1,
  output out2,
  output out3,
  output out4,
  output out5,
  output out6,
  output out7
);
  assign out0 = sel2 ? 0 : (sel1 ? 0 : (sel0 ? 0 : in));
  assign out1 = sel2 ? 0 : (sel1 ? 0 : (sel0 ? in : 0));
  assign out2 = sel2 ? 0 : (sel1 ? (sel0 ? 0 : in) : 0);
  assign out3 = sel2 ? 0 : (sel1 ? (sel0 ? in : 0) : 0);
  assign out4 = sel2 ? (sel1 ? 0 : (sel0 ? 0 : in)) : 0;
  assign out5 = sel2 ? (sel1 ? 0 : (sel0 ? in : 0)) : 0;
  assign out6 = sel2 ? (sel1 ? (sel0 ? 0 : in) : 0) : 0;
  assign out7 = sel2 ? (sel1 ? (sel0 ? in : 0) : 0) : 0;
endmodule
