`include "circuits/mux/mux_2to1.v"
`include "circuits/mux/mux_4to1.v"
`include "circuits/mux/mux_8to1.v"
`include "circuits/mux/mux16_2to1.v"
`include "circuits/mux/mux16_4to1.v"
`include "circuits/mux/mux16_8to1.v"
`include "circuits/mux/dmux_1to2.v"
`include "circuits/mux/dmux_1to4.v"
`include "circuits/mux/dmux_1to8.v"

module mux_tb();
    // Testbench signals for mux_2to1
    reg [1:0] in_2to1;
    reg sel_2to1;
    wire out_2to1;

    // Testbench signals for mux_4to1
    reg [3:0] in_4to1;
    reg [1:0] sel_4to1;
    wire out_4to1;

    // Testbench signals for mux_8to1
    reg [7:0] in_8to1;
    reg [2:0] sel_8to1;
    wire out_8to1;

    // Testbench signals for mux16_2to1
    reg [15:0] in0_16_2to1, in1_16_2to1;
    reg sel_16_2to1;
    wire [15:0] out_16_2to1;

    // Testbench signals for mux16_4to1
    reg [15:0] in0_16_4to1, in1_16_4to1, in2_16_4to1, in3_16_4to1;
    reg [1:0] sel_16_4to1;
    wire [15:0] out_16_4to1;

    // Testbench signals for mux16_8to1
    reg [15:0] in0_16_8to1, in1_16_8to1, in2_16_8to1, in3_16_8to1, in4_16_8to1, in5_16_8to1, in6_16_8to1, in7_16_8to1;
    reg [2:0] sel_16_8to1;
    wire [15:0] out_16_8to1;

    // Testbench signals for dmux_1to2
    reg in_1to2, sel_1to2;
    wire [1:0]out_1to2;

    // Testbench signals for dmux_1to4
    reg in_1to4;
    reg [1:0] sel_1to4;
    wire [3:0] out_1to4;

    // Testbench signals for dmux_1to8
    reg in_1to8;
    reg [2:0] sel_1to8;
    wire [7:0] out_1to8;

    // Instantiate the mux_2to1 module as Unit Under Test (UUT)
    mux_2to1 uut_2to1 (
        .in(in_2to1),
        .sel(sel_2to1),
        .out(out_2to1)
    );

    // Instantiate the mux_4to1 module as Unit Under Test (UUT)
    mux_4to1 uut_4to1 (
        .in(in_4to1),
        .sel(sel_4to1),
        .out(out_4to1)
    );

    // Instantiate the mux_8to1 module as Unit Under Test (UUT)
    mux_8to1 uut_8to1 (
        .in(in_8to1),
        .sel(sel_8to1),
        .out(out_8to1)
    );

    // Instantiate the mux16_2to1 module as Unit Under Test (UUT)
    mux16_2to1 uut16_2to1 (
        .in_0(in0_16_2to1),
        .in_1(in1_16_2to1),
        .sel(sel_16_2to1),
        .out(out_16_2to1)
    );

    // Instantiate the mux16_4to1 module as Unit Under Test (UUT)
    mux16_4to1 uut16_4to1 (
        .in0(in0_16_4to1), .in1(in1_16_4to1), .in2(in2_16_4to1), .in3(in3_16_4to1), .sel(sel_16_4to1), .out(out_16_4to1)
    );

    // Instantiate the mux16_8to1 module as Unit Under Test (UUT)
    mux16_8to1 uut16_8to1 (
        .in0(in0_16_8to1), .in1(in1_16_8to1), .in2(in2_16_8to1), .in3(in3_16_8to1), .in4(in4_16_8to1), .in5(in5_16_8to1), .in6(in6_16_8to1), .in7(in7_16_8to1), .sel(sel_16_8to1), .out(out_16_8to1)
    );

    // Instantiate the dmux_1to2 module as Unit Under Test (UUT)
    dmux_1to2 uut_1to2 (
        .in(in_1to2),
        .sel(sel_1to2),
        .out(out_1to2)
    );

    // Instantiate the dmux_1to4 module as Unit Under Test (UUT)
    dmux_1to4 uut_1to4 (
        .in(in_1to4),
        .sel(sel_1to4),
        .out(out_1to4)
    );

    // Instantiate the dmux_1to8 module as Unit Under Test (UUT)
    dmux_1to8 uut_1to8 (
        .in(in_1to8),
        .sel(sel_1to8),
        .out(out_1to8)
    );

    // Task to verify mux_2to1 operation
    task verify_mux_2to1;
        input [1:0] in;
        input sel, expected;

        begin
            in_2to1 = in; sel_2to1 = sel;
            #10;
            if (out_2to1 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_2to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_2to1);
            end
        end
    endtask

    // Task to verify mux_4to1 operation
    task verify_mux_4to1;
        input [3:0] in;
        input [1:0] sel;
        input expected;
        begin
            in_4to1 = in; sel_4to1 = sel;
            #10;
            if (out_4to1 !== expected) begin
                $display("[TEST FAILED] in=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    in, sel[0], sel[1], expected, out_4to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    in, sel[0], sel[1], expected, out_4to1);
            end
        end
    endtask

    // Task to verify mux_8to1 operation
    task verify_mux_8to1;
        input [7:0] in;
        input [2:0] sel;
        input expected;
        begin
            in_8to1 = in;
            sel_8to1 = sel;
            #10;
            if (out_8to1 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_8to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_8to1);
            end
        end
    endtask

    // Task to verify mux16_2to1 operation
    task verify_mux16_2to1;
        input [15:0] in0, in1;
        input sel;
        input [15:0] expected;

        begin
            in0_16_2to1 = in0; in1_16_2to1 = in1; sel_16_2to1 = sel;
            #10;
            if (out_16_2to1 !== expected) begin
                $display("[TEST FAILED] in0=%b in1=%b sel=%b: Expected %b, got %b", 
                    in0, in1, sel, expected, out_16_2to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in0=%b in1=%b sel=%b: Expected %b, got %b", 
                    in0, in1, sel, expected, out_16_2to1);
            end
        end
    endtask

    // Task to verify mux16_4to1 operation
    task verify_mux16_4to1;
        input [15:0] in0, in1, in2, in3;
        input [1:0] sel;
        input [15:0] expected;

        begin
            in0_16_4to1 = in0; in1_16_4to1 = in1; in2_16_4to1 = in2; in3_16_4to1 = in3; sel_16_4to1 = sel;
            #10;
            if (out_16_4to1 !== expected) begin
                $display("[TEST FAILED] in0=%b in1=%b in2=%b in3=%b sel=%b: Expected %b, got %b", 
                    in0, in1, in2, in3, sel, expected, out_16_4to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in0=%b in1=%b in2=%b in3=%b sel=%b: Expected %b, got %b", 
                    in0, in1, in2, in3, sel, expected, out_16_4to1);
            end
        end
    endtask

    // Task to verify mux16_8to1 operation
    task verify_mux16_8to1;
        input [15:0] in0, in1, in2, in3, in4, in5, in6, in7;
        input [2:0] sel;
        input [15:0] expected;

        begin
            in0_16_8to1 = in0; in1_16_8to1 = in1; in2_16_8to1 = in2; in3_16_8to1 = in3; in4_16_8to1 = in4; in5_16_8to1 = in5; in6_16_8to1 = in6; in7_16_8to1 = in7; sel_16_8to1 = sel;
            #10;
            if (out_16_8to1 !== expected) begin
                $display("[TEST FAILED] in0=%b in1=%b in2=%b in3=%b in4=%b in5=%b in6=%b in7=%b sel=%b: Expected %b, got %b", 
                    in0, in1, in2, in3, in4, in5, in6, in7, sel, expected, out_16_8to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in0=%b in1=%b in2=%b in3=%b in4=%b in5=%b in6=%b in7=%b sel=%b: Expected %b, got %b", 
                    in0, in1, in2, in3, in4, in5, in6, in7, sel, expected, out_16_8to1);
            end
        end
    endtask

    // Task to verify dmux_1to2 operation
    task verify_dmux_1to2;
        input in, sel;
        input [1:0] expected;

        begin
            in_1to2 = in; sel_1to2 = sel;
            #10;
            if (out_1to2 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_1to2);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_1to2);
            end
        end
    endtask

    // Task to verify dmux_1to4 operation
    task verify_dmux_1to4;
        input in;
        input [1:0] sel;
        input [3:0] expected;

        begin
            in_1to4 = in; sel_1to4 = sel;
            #10;
            if (out_1to4 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_1to4);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_1to4);
            end
        end
    endtask

    // Task to verify dmux_1to8 operation
    task verify_dmux_1to8;
        input in;
        input [2:0] sel;
        input [7:0] expected;
        begin
            in_1to8 = in; sel_1to8 = sel;
            #10;
            if (out_1to8 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_1to8);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel, expected, out_1to8);
            end
        end
    endtask

    initial begin
        // Test mux_2to1
        $display("Testing Mux_2to1");
        verify_mux_2to1(.in(2'b00), .sel(0), .expected(0));
        verify_mux_2to1(.in(2'b01), .sel(0), .expected(1));
        verify_mux_2to1(.in(2'b00), .sel(1), .expected(0));
        verify_mux_2to1(.in(2'b10), .sel(1), .expected(1));

        // Test mux_4to1
        $display("Testing Mux_4to1");
        verify_mux_4to1(.in(4'b0000), .sel(2'b00), .expected(0));
        verify_mux_4to1(.in(4'b0001), .sel(2'b00), .expected(1));
        verify_mux_4to1(.in(4'b0000), .sel(2'b01), .expected(0));
        verify_mux_4to1(.in(4'b0010), .sel(2'b01), .expected(1));
        verify_mux_4to1(.in(4'b0000), .sel(2'b10), .expected(0));
        verify_mux_4to1(.in(4'b0100), .sel(2'b10), .expected(1));
        verify_mux_4to1(.in(4'b0000), .sel(2'b11), .expected(0));
        verify_mux_4to1(.in(4'b1000), .sel(2'b11), .expected(1));

        // Test mux_8to1
        $display("Testing Mux_8to1");
        verify_mux_8to1(.in(8'b00000000), .sel(3'b000), .expected(0));
        verify_mux_8to1(.in(8'b00000001), .sel(3'b000), .expected(1));
        verify_mux_8to1(.in(8'b00000000), .sel(3'b001), .expected(0));
        verify_mux_8to1(.in(8'b00000010), .sel(3'b001), .expected(1));

        verify_mux_8to1(.in(8'b00000000), .sel(3'b010), .expected(0));
        verify_mux_8to1(.in(8'b00000100), .sel(3'b010), .expected(1));
        verify_mux_8to1(.in(8'b00000000), .sel(3'b011), .expected(0));
        verify_mux_8to1(.in(8'b00001000), .sel(3'b011), .expected(1));

        verify_mux_8to1(.in(8'b00000000), .sel(3'b100), .expected(0));
        verify_mux_8to1(.in(8'b00010000), .sel(3'b100), .expected(1));
        verify_mux_8to1(.in(8'b00000000), .sel(3'b101), .expected(0));
        verify_mux_8to1(.in(8'b00100000), .sel(3'b101), .expected(1));

        verify_mux_8to1(.in(8'b00000000), .sel(3'b110), .expected(0));
        verify_mux_8to1(.in(8'b01000000), .sel(3'b110), .expected(1));
        verify_mux_8to1(.in(8'b00000000), .sel(3'b111), .expected(0));
        verify_mux_8to1(.in(8'b10000000), .sel(3'b111), .expected(1));

        // test mux16_2to1
        $display("Testing Mux16_2to1");
        verify_mux16_2to1(.in0(16'h0000), .in1(16'hFFFF), .sel(0), .expected(16'h0000));
        verify_mux16_2to1(.in0(16'hAAAA), .in1(16'h5555), .sel(0), .expected(16'hAAAA));
        verify_mux16_2to1(.in0(16'h0000), .in1(16'hFFFF), .sel(1), .expected(16'hFFFF));
        verify_mux16_2to1(.in0(16'hFFFF), .in1(16'h0000), .sel(1), .expected(16'h0000));
        verify_mux16_2to1(.in0(16'h1234), .in1(16'h5678), .sel(0), .expected(16'h1234));
        verify_mux16_2to1(.in0(16'hABCD), .in1(16'hEF01), .sel(1), .expected(16'hEF01));

        // Test mux16_4to1
        $display("Testing Mux16_4to1");
        verify_mux16_4to1(.in0(16'h0000), .in1(16'hFFFF), .in2(16'hAAAA), .in3(16'h5555), .sel(2'b00), .expected(16'h0000));  // select a=16'h0000
        verify_mux16_4to1(.in0(16'hABCD), .in1(16'hEF01), .in2(16'h1234), .in3(16'h5678), .sel(2'b01), .expected(16'hEF01));  // select b=16'hEF01
        verify_mux16_4to1(.in0(16'hABCD), .in1(16'hEF01), .in2(16'h1234), .in3(16'h5678), .sel(2'b10), .expected(16'h1234));  // select c=16'h1234
        verify_mux16_4to1(.in0(16'hABCD), .in1(16'hEF01), .in2(16'h1234), .in3(16'h5678), .sel(2'b11), .expected(16'h5678));  // select d=16'h5678

        // Test mux16_8to1
        $display("Testing Mux16_8to1");
        verify_mux16_8to1(
            .in0(16'h0010), .in1(16'hFFFF), .in2(16'hAAAA), .in3(16'h5555), .in4(16'hABCD), .in5(16'hEF01), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b000), .expected(16'h0010)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFAFF), .in2(16'hAAAA), .in3(16'h5555), .in4(16'hABCD), .in5(16'hEF01), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b001), .expected(16'hFAFF)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFFFF), .in2(16'hABCA), .in3(16'h5555), .in4(16'hABCD), .in5(16'hEF01), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b010), .expected(16'hABCA)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFFFF), .in2(16'hABCA), .in3(16'h5555), .in4(16'hABCD), .in5(16'hEF01), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b011), .expected(16'h5555)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFFFF), .in2(16'hAAAA), .in3(16'h5555), .in4(16'h1111), .in5(16'hEF01), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b100), .expected(16'h1111)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFFFF), .in2(16'hAAAA), .in3(16'h5555), .in4(16'hABCD), .in5(16'h2222), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b101), .expected(16'h2222)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFFFF), .in2(16'hAAAA), .in3(16'h5555), .in4(16'hABCD), .in5(16'h2222), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b110), .expected(16'h1234)
        );
        verify_mux16_8to1(
            .in0(16'h0000), .in1(16'hFFFF), .in2(16'hAAAA), .in3(16'h5555), .in4(16'hABCD), .in5(16'h2222), .in6(16'h1234), .in7(16'h5678),
            .sel(3'b111), .expected(16'h5678)
        );

        // Test dmux_1to2
        $display("Testing Dmux_1to2");
        verify_dmux_1to2(.in(0), .sel(0), .expected(2'b00));
        verify_dmux_1to2(.in(1), .sel(0), .expected(2'b01));
        verify_dmux_1to2(.in(0), .sel(1), .expected(2'b00));
        verify_dmux_1to2(.in(1), .sel(1), .expected(2'b10));

        // Test dmux_1to4
        $display("Testing Dmux_1to4");
        verify_dmux_1to4(.in(0), .sel(2'b00), .expected(4'b0000));
        verify_dmux_1to4(.in(1), .sel(2'b00), .expected(4'b0001));
        verify_dmux_1to4(.in(0), .sel(2'b01), .expected(4'b0000));
        verify_dmux_1to4(.in(1), .sel(2'b01), .expected(4'b0010));
        verify_dmux_1to4(.in(0), .sel(2'b10), .expected(4'b0000));
        verify_dmux_1to4(.in(1), .sel(2'b10), .expected(4'b0100));
        verify_dmux_1to4(.in(0), .sel(2'b11), .expected(4'b0000));
        verify_dmux_1to4(.in(1), .sel(2'b11), .expected(4'b1000));

        $display("Testing Dmux_1to8");
        verify_dmux_1to8(.in(0), .sel(3'b000), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b000), .expected(8'b00000001));
        verify_dmux_1to8(.in(0), .sel(3'b001), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b001), .expected(8'b00000010));

        verify_dmux_1to8(.in(0), .sel(3'b010), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b010), .expected(8'b00000100));
        verify_dmux_1to8(.in(0), .sel(3'b011), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b011), .expected(8'b00001000));

        verify_dmux_1to8(.in(0), .sel(3'b100), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b100), .expected(8'b00010000));
        verify_dmux_1to8(.in(0), .sel(3'b101), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b101), .expected(8'b00100000));

        verify_dmux_1to8(.in(0), .sel(3'b110), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b110), .expected(8'b01000000));
        verify_dmux_1to8(.in(0), .sel(3'b111), .expected(8'b00000000));
        verify_dmux_1to8(.in(1), .sel(3'b111), .expected(8'b10000000));

        $finish;
    end

endmodule
