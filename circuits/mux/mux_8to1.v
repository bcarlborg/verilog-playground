
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
  input a,
  input b,
  input c,
  input d,
  input e,
  input f,
  input g,
  input h,
  input sel0,
  input sel1,
  input sel2,
  output out
);
  assign out = sel2
                ? (sel1
                  ? (sel0
                    ? h
                    : g)
                  : (sel0
                    ? f
                    : e)
                  )
                : (sel1
                  ? (sel0
                    ? d
                    : c)
                  : (sel0
                    ? b
                    : a)
                  );
endmodule
