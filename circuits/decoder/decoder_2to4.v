module decoder_2to4(
  input [1:0] in,
  output [3:0] out
);
  assign out = in[1] ? (in[0] ? 4'b1000 : 4'b0100) : (in[0] ? 4'b0010 : 4'b0001);
endmodule
