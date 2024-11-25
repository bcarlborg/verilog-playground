
// MUX 4 TO 1
// Multiplexer with four inputs and two selector.
// When sel0=0 & sel1=0 out is a.
// When sel0=0 & sel1=1 out is b.
// When sel0=1 & sel1=0 out is c.
// When sel0=1 & sel1=1 out is d.
module mux_4to1(
  // TODO(bcarlborg): Convert this into a bus
  input [3:0] in,
  input [1:0] sel,
  output out
);
  assign out = sel[1] ? (sel[0] ? in[3] : in[2]) : (sel[0] ? in[1] : in[0]);
endmodule
