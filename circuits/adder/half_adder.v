`ifndef HALF_ADDER_V
`define HALF_ADDER_V

// INPUTS: a, b OUTPUTS: sum, carry
// a     b     sum   carry
// 0     0     0     0
// 0     1     1     0
// 1     0     1     0
// 1     1     0     1
module half_adder(
  input [1:0] in,
  output sum,
  output carry
);
  assign sum = in[0] ^ in[1];
  assign carry = in[0] & in[1];
endmodule

`endif