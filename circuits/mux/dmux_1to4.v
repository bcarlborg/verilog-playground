// DEMULTIPLEXER 1 TO 4
// Demultiplexer with one input, four outputs, and 2 selectors.
// when sel0:0 & sel1:0, out0 is a.
// when sel0:1 & sel1:0, out1 is a.
// when sel0:0 & sel1:1, out2 is a.
// when sel0:1 & sel1:1, out3 is a.
module dmux_1to4(
  input in,
  input sel0,
  input sel1,
  output out0,
  output out1,
  output out2,
  output out3
);
  assign out0 = sel1 ? 0 : (sel0? 0 : in);
  assign out1 = sel1 ? 0 : (sel0 ? in : 0);
  assign out2 = sel1 ? (sel0 ? 0 : in) : 0;
  assign out3 = sel1 ? (sel0 ? in : 0) : 0;
endmodule
