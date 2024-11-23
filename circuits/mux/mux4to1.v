
// MUX 4 TO 1
// Multiplexer with four inputs and two selector.
// When sel0=0 & sel1=0 out is a.
// When sel0=0 & sel1=1 out is b.
// When sel0=1 & sel1=0 out is c.
// When sel0=1 & sel1=1 out is d.
module mux4to1(
  input a,
  input b,
  input c,
  input d,
  input sel0,
  input sel1,
  output out
);
  assign out = sel1 ? (sel0 ? d : c) : (sel0 ? b : a);
endmodule