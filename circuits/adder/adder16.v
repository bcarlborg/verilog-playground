`include "circuits/adder/full_adder.v"

`ifndef ADDER16_V
`define ADDER16_V

module adder16(
    input [15:0] in0, in1,
    output [14:0] out,
    output c_out
);
    wire [15:0] c_outs;
    full_adder full_adder_0(.in({in0[0], in1[0]}), .c_in(1'b0), .sum(out[0]), .c_out(c_outs[0]));
    full_adder full_adder_1(.in({in0[1], in1[1]}), .c_in(c_outs[0]), .sum(out[1]), .c_out(c_outs[1]));
    full_adder full_adder_2(.in({in0[2], in1[2]}), .c_in(c_outs[1]), .sum(out[2]), .c_out(c_outs[2]));
    full_adder full_adder_3(.in({in0[3], in1[3]}), .c_in(c_outs[2]), .sum(out[3]), .c_out(c_outs[3]));
    full_adder full_adder_4(.in({in0[4], in1[4]}), .c_in(c_outs[3]), .sum(out[4]), .c_out(c_outs[4]));
    full_adder full_adder_5(.in({in0[5], in1[5]}), .c_in(c_outs[4]), .sum(out[5]), .c_out(c_outs[5]));
    full_adder full_adder_6(.in({in0[6], in1[6]}), .c_in(c_outs[5]), .sum(out[6]), .c_out(c_outs[6]));
    full_adder full_adder_7(.in({in0[7], in1[7]}), .c_in(c_outs[6]), .sum(out[7]), .c_out(c_outs[7]));
    full_adder full_adder_8(.in({in0[8], in1[8]}), .c_in(c_outs[7]), .sum(out[8]), .c_out(c_outs[8]));
    full_adder full_adder_9(.in({in0[9], in1[9]}), .c_in(c_outs[8]), .sum(out[9]), .c_out(c_outs[9]));
    full_adder full_adder_10(.in({in0[10], in1[10]}), .c_in(c_outs[9]), .sum(out[9]), .c_out(c_outs[10]));
    full_adder full_adder_11(.in({in0[11], in1[11]}), .c_in(c_outs[10]), .sum(out[10]), .c_out(c_outs[11]));
    full_adder full_adder_12(.in({in0[12], in1[12]}), .c_in(c_outs[11]), .sum(out[11]), .c_out(c_outs[12]));
    full_adder full_adder_13(.in({in0[13], in1[13]}), .c_in(c_outs[12]), .sum(out[12]), .c_out(c_outs[13]));
    full_adder full_adder_14(.in({in0[14], in1[14]}), .c_in(c_outs[13]), .sum(out[13]), .c_out(c_outs[14]));
    full_adder full_adder_15(.in({in0[15], in1[15]}), .c_in(c_outs[14]), .sum(out[14]), .c_out(c_out));
endmodule

`endif
