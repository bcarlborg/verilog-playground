`ifndef MUX_2TO1_V
`define MUX_2TO1_V

// MUX 2 TO 1
// Multiplexer with two inputs and one selector.
// When sel is 0, out is a. When sel is 1, out is b.
module mux_2to1(
  input [1:0] in,
  input sel,
  output out
);
  assign out = sel ? in[1] : in[0];
endmodule

`endif
