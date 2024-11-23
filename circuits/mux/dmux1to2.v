// DEMULTIPLEXER 1 TO 2
// Demultiplexer with one input, two outputs, and 1 selector.
// When sel is 0, out0 is in and out1 is 0.
// When sel is 1, out0 is 0 and out1 is in.
module dmux1to2(
  input in,
  input sel,
  output out0,
  output out1
);
  assign out0 = sel ? 0 : in;
  assign out1 = sel ? in : 0;
endmodule