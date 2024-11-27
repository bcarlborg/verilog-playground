
`include "circuits/adder/half_adder.v"

`ifndef FULL_ADDER_V
`define FULL_ADDER_V

module full_adder(
  input [1:0] in,
  input c_in,
  output sum,
  output c_out
);
  wire sum_half, carry_1, carry_2;

  half_adder half_adder_1(.in(in[1:0]), .sum(sum_half), .carry(carry_1));
  half_adder half_adder_2(.in({sum_half, c_in}), .sum(sum), .carry(carry_2));

  assign c_out = carry_1 | carry_2;
endmodule

`endif
