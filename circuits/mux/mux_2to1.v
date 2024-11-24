// MUX 2 TO 1
// Multiplexer with two inputs and one selector.
// When sel is 0, out is a. When sel is 1, out is b.
module mux_2to1(
  input a,
  input b,
  input sel,
  output out
);
  assign out = sel ? b : a;
endmodule