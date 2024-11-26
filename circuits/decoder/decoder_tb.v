`include "circuits/decoder/decoder_2to4.v"
`include "circuits/decoder/decoder_4to16.v"
module decoder_tb();

  reg [1:0] in_2to4;
  wire [3:0] out_2to4;
  decoder_2to4 dut_2to4(.in(in_2to4), .out(out_2to4));

  reg [3:0] in_4to16;
  wire [15:0] out_4to16;
  decoder_4to16 dut_4to16(.in(in_4to16), .out(out_4to16));

  task verify_decoder_2to4;
    input [1:0] in;
    input [3:0] expected;
    begin
      in_2to4 = in;
      #10;
      if (out_2to4 !== expected) begin
        $display("[TEST FAILED] in=%b, expected=%b, got=%b", in, expected, out_2to4);
      end else begin
        $display("[TEST PASSED] in=%b, expected=%b, got=%b", in, expected, out_2to4);
      end
    end
  endtask

  task verify_decoder_4to16;
    input [3:0] in;
    input [15:0] expected;
    begin
      in_4to16 = in;
      #10;
      if (out_4to16 !== expected) begin
        $display("[TEST FAILED] in=%b, expected=%b, got=%b", in, expected, out_4to16);
      end else begin
        $display("[TEST PASSED] in=%b, expected=%b, got=%b", in, expected, out_4to16);
      end
    end
  endtask

  initial begin
    verify_decoder_2to4(.in(2'b00), .expected(4'b0001));
    verify_decoder_2to4(.in(2'b01), .expected(4'b0010));
    verify_decoder_2to4(.in(2'b10), .expected(4'b0100));
    verify_decoder_2to4(.in(2'b11), .expected(4'b1000));
  end

  initial begin
    verify_decoder_4to16(.in(4'b0000), .expected(16'b0000000000000001));
    verify_decoder_4to16(.in(4'b0001), .expected(16'b0000000000000010));
    verify_decoder_4to16(.in(4'b0010), .expected(16'b0000000000000100));
    verify_decoder_4to16(.in(4'b0011), .expected(16'b0000000000001000));
    verify_decoder_4to16(.in(4'b0100), .expected(16'b0000000000010000));
    verify_decoder_4to16(.in(4'b0101), .expected(16'b0000000000100000));
    verify_decoder_4to16(.in(4'b0110), .expected(16'b0000000001000000));
    verify_decoder_4to16(.in(4'b0111), .expected(16'b0000000010000000));
    verify_decoder_4to16(.in(4'b1000), .expected(16'b0000000100000000));
    verify_decoder_4to16(.in(4'b1001), .expected(16'b0000001000000000));
    verify_decoder_4to16(.in(4'b1010), .expected(16'b0000010000000000));
    verify_decoder_4to16(.in(4'b1011), .expected(16'b0000100000000000));
    verify_decoder_4to16(.in(4'b1100), .expected(16'b0001000000000000));
    verify_decoder_4to16(.in(4'b1101), .expected(16'b0010000000000000));
    verify_decoder_4to16(.in(4'b1110), .expected(16'b0100000000000000));
    verify_decoder_4to16(.in(4'b1111), .expected(16'b1000000000000000));
  end

endmodule
