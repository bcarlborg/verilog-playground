`ifndef MUX_8TO1_V
`define MUX_8TO1_V

// MUX 8 TO 1
// Multiplexer with eight inputs and three selectors.
// When sel0=0 & sel1=0 & sel2=0 out is a.
// When sel0=1 & sel1=0 & sel2=0 out is b.
// When sel0=0 & sel1=1 & sel2=0 out is c.
// When sel0=1 & sel1=1 & sel2=0 out is d.
// When sel0=0 & sel1=0 & sel2=1 out is e.
// When sel0=1 & sel1=0 & sel2=1 out is f.
// When sel0=0 & sel1=1 & sel2=1 out is g.
// When sel0=1 & sel1=1 & sel2=1 out is h.
module mux_8to1(
  // TODO(bcarlborg): Convert this into a bus
  input [7:0] in,
  input h,
  // TODO(bcarlborg): Convert this into a bus
  input [2:0] sel,
  output out
);
  assign out = sel[2]
                ? (sel[1]
                  ? (sel[0]
                    ? in[7]
                    : in[6])
                  : (sel[0]
                    ? in[5]
                    : in[4])
                  )
                : (sel[1]
                  ? (sel[0]
                    ? in[3]
                    : in[2])
                  : (sel[0]
                    ? in[1]
                    : in[0])
                  );
endmodule

`endif
