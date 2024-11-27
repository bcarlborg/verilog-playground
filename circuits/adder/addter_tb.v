`include "circuits/adder/half_adder.v"
`include "circuits/adder/full_adder.v"
`include "circuits/adder/adder16.v"

module adder_tb();

  reg [1:0] in_half;
  wire sum_half, carry_half;

  reg [1:0] in_full;
  reg c_in_full;
  wire sum_full, c_out_full;

  reg [15:0] in0_adder16, in1_adder16;
  wire [14:0] out_adder16;
  wire c_out_adder16;

  half_adder dut_half_adder(.in(in_half), .sum(sum_half), .carry(carry_half));
  full_adder dut_full_adder(.in(in_full), .c_in(c_in_full), .sum(sum_full), .c_out(c_out_full));
  adder16 dut_adder16(.in0(in0_adder16), .in1(in1_adder16), .out(out_adder16), .c_out(c_out_adder16));

  task verify_half_adder;
    input [1:0] in, expected_sum, expected_carry;
    begin
      in_half = in;
      #10;
      if (sum_half !== expected_sum || carry_half !== expected_carry) begin
        $display("[TEST FAILED] in=%b, expected_sum=%b, expected_carry=%b, got_sum=%b, got_carry=%b", in, expected_sum, expected_carry, sum_half, carry_half);
      end else begin
        $display("[TEST PASSED] in=%b, expected_sum=%b, expected_carry=%b, got_sum=%b, got_carry=%b", in, expected_sum, expected_carry, sum_half, carry_half);
      end
    end
  endtask

  task verify_full_adder;
    input [1:0] in;
    input c_in, expected_sum, expected_carry;
    begin
      in_full = in;
      c_in_full = c_in;
      #10;
      if (sum_full !== expected_sum || c_out_full !== expected_carry) begin
        $display("[TEST FAILED] in=%b, c_in=%b, expected_sum=%b, expected_carry=%b, got_sum=%b, got_carry=%b", in, c_in, expected_sum, expected_carry, sum_full, c_out_full);
      end else begin
        $display("[TEST PASSED] in=%b, c_in=%b, expected_sum=%b, expected_carry=%b, got_sum=%b, got_carry=%b", in, c_in, expected_sum, expected_carry, sum_full, c_out_full);
      end
    end
  endtask

  task verify_adder16;
    input [15:0] in0, in1, expected_out;
    input expected_c_out;
    begin
      in0_adder16 = in0;
      in1_adder16 = in1;
      #10;
      if (out_adder16 !== expected_out || c_out_adder16 !== expected_c_out) begin
        $display("[TEST FAILED] in0=%b, in1=%b, expected_out=%b, expected_c_out=%b, got_out=%b, got_c_out=%b", in0, in1, expected_out, expected_c_out, out_adder16, c_out_adder16);
      end else begin
        $display("[TEST PASSED] in0=%b, in1=%b, expected_out=%b, expected_c_out=%b, got_out=%b, got_c_out=%b", in0, in1, expected_out, expected_c_out, out_adder16, c_out_adder16);
      end
    end
  endtask

  initial begin
    verify_half_adder(.in(2'b00), .expected_sum(0), .expected_carry(0));
    verify_half_adder(.in(2'b01), .expected_sum(1), .expected_carry(0));
    verify_half_adder(.in(2'b10), .expected_sum(1), .expected_carry(0));
    verify_half_adder(.in(2'b11), .expected_sum(0), .expected_carry(1));

    verify_full_adder(.in(2'b00), .c_in(0), .expected_sum(0), .expected_carry(0));
    verify_full_adder(.in(2'b00), .c_in(1), .expected_sum(1), .expected_carry(0));

    verify_full_adder(.in(2'b01), .c_in(0), .expected_sum(1), .expected_carry(0));
    verify_full_adder(.in(2'b01), .c_in(1), .expected_sum(0), .expected_carry(1));

    verify_full_adder(.in(2'b10), .c_in(0), .expected_sum(1), .expected_carry(0));
    verify_full_adder(.in(2'b10), .c_in(1), .expected_sum(0), .expected_carry(1));

    verify_full_adder(.in(2'b11), .c_in(0), .expected_sum(0), .expected_carry(1));
    verify_full_adder(.in(2'b11), .c_in(1), .expected_sum(1), .expected_carry(1));

    verify_adder16(.in0(16'b0000000000000000), .in1(16'b0000000000000000), .expected_out(16'b0000000000000000), .expected_c_out(1'b0));
    verify_adder16(.in0(16'b0000000000000001), .in1(16'b0000000000000001), .expected_out(16'b0000000000000010), .expected_c_out(1'b0));
    verify_adder16(.in0(16'b1000000000000000), .in1(16'b1000000000000000), .expected_out(16'b0000000000000000), .expected_c_out(1'b1));
  end

endmodule