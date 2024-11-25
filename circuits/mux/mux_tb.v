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
    reg a_8to1, b_8to1, c_8to1, d_8to1, e_8to1, f_8to1, g_8to1, h_8to1, sel0_8to1, sel1_8to1, sel2_8to1;
    wire out_8to1;

    // Testbench signals for mux16_2to1
    reg [15:0] a16_2to1, b16_2to1;
    reg sel16_2to1;
    wire [15:0] out16_2to1;

    // Testbench signals for mux16_4to1
    reg [15:0] a16_4to1, b16_4to1, c16_4to1, d16_4to1;
    reg [1:0] sel16_4to1;
    wire [15:0] out16_4to1;

    // Testbench signals for mux16_8to1
    reg [15:0] a16_8to1, b16_8to1, c16_8to1, d16_8to1, e16_8to1, f16_8to1, g16_8to1, h16_8to1;
    reg [2:0] sel16_8to1;
    wire [15:0] out16_8to1;

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
        .a(a_8to1),
        .b(b_8to1),
        .c(c_8to1),
        .d(d_8to1),
        .e(e_8to1),
        .f(f_8to1),
        .g(g_8to1),
        .h(h_8to1),
        .sel0(sel0_8to1),
        .sel1(sel1_8to1),
        .sel2(sel2_8to1),
        .out(out_8to1)
    );

    // Instantiate the mux16_2to1 module as Unit Under Test (UUT)
    mux16_2to1 uut16_2to1 (
        .a(a16_2to1),
        .b(b16_2to1),
        .sel(sel16_2to1),
        .out(out16_2to1)
    );

    // Instantiate the mux16_4to1 module as Unit Under Test (UUT)
    mux16_4to1 uut16_4to1 (
        .a(a16_4to1), .b(b16_4to1), .c(c16_4to1), .d(d16_4to1), .sel(sel16_4to1), .out(out16_4to1)
    );

    // Instantiate the mux16_8to1 module as Unit Under Test (UUT)
    mux16_8to1 uut16_8to1 (
        .a(a16_8to1), .b(b16_8to1), .c(c16_8to1), .d(d16_8to1), .e(e16_8to1), .f(f16_8to1), .g(g16_8to1), .h(h16_8to1), .sel(sel16_8to1), .out(out16_8to1)
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
        input sel_in, expected;

        begin
            in_2to1 = in; sel_2to1 = sel_in;
            #10;
            if (out_2to1 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel_in, expected, out_2to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in, sel_in, expected, out_2to1);
            end
        end
    endtask

    // Task to verify mux_4to1 operation
    task verify_mux_4to1;
        input [3:0] in_in;
        input [1:0] sel_in;
        input expected;
        begin
            in_4to1 = in_in; sel_4to1 = sel_in;
            #10;
            if (out_4to1 !== expected) begin
                $display("[TEST FAILED] in=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    in_in, sel_in[0], sel_in[1], expected, out_4to1);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    in_in, sel_in[0], sel_in[1], expected, out_4to1);
            end
        end
    endtask

    // Task to verify mux_8to1 operation
    task verify_mux_8to1;
        input a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel0_in, sel1_in, sel2_in, expected;
        begin
            a_8to1 = a_in; b_8to1 = b_in; c_8to1 = c_in; d_8to1 = d_in; e_8to1 = e_in; f_8to1 = f_in; g_8to1 = g_in; h_8to1 = h_in;
            sel0_8to1 = sel0_in; sel1_8to1 = sel1_in; sel2_8to1 = sel2_in;
            #10;
            if (out_8to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel0=%b sel1=%b sel2=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel0_in, sel1_in, sel2_in, expected, out_8to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel0=%b sel1=%b sel2=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel0_in, sel1_in, sel2_in, expected, out_8to1);
            end
        end
    endtask

    // Task to verify mux16_2to1 operation
    task verify_mux16_2to1;
        input [15:0] a_in, b_in;
        input sel_in;
        input [15:0] expected;

        begin
            a16_2to1 = a_in; b16_2to1 = b_in; sel16_2to1 = sel_in;
            #10;
            if (out16_2to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out16_2to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out16_2to1);
            end
        end
    endtask

    // Task to verify mux16_4to1 operation
    task verify_mux16_4to1;
        input [15:0] a_in, b_in, c_in, d_in;
        input [1:0] sel_in;
        input [15:0] expected;

        begin
            a16_4to1 = a_in; b16_4to1 = b_in; c16_4to1 = c_in; d16_4to1 = d_in; sel16_4to1 = sel_in;
            #10;
            if (out16_4to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b c=%b d=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, sel_in, expected, out16_4to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b c=%b d=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, sel_in, expected, out16_4to1);
            end
        end
    endtask

    // Task to verify mux16_8to1 operation
    task verify_mux16_8to1;
        input [15:0] a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in;
        input [2:0] sel_in;
        input [15:0] expected;

        begin
            a16_8to1 = a_in; b16_8to1 = b_in; c16_8to1 = c_in; d16_8to1 = d_in; e16_8to1 = e_in; f16_8to1 = f_in; g16_8to1 = g_in; h16_8to1 = h_in; sel16_8to1 = sel_in;
            #10;
            if (out16_8to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel_in, expected, out16_8to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel_in, expected, out16_8to1);
            end
        end
    endtask

    // Task to verify dmux_1to2 operation
    task verify_dmux_1to2;
        input in_in, sel_in;
        input [1:0] expected;

        begin
            in_1to2 = in_in; sel_1to2 = sel_in;
            #10;
            if (out_1to2 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in_in, sel_in, expected, out_1to2);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in_in, sel_in, expected, out_1to2);
            end
        end
    endtask

    // Task to verify dmux_1to4 operation
    task verify_dmux_1to4;
        input in_in;
        input [1:0] sel_in;
        input [3:0] expected;

        begin
            in_1to4 = in_in; sel_1to4 = sel_in;
            #10;
            if (out_1to4 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in_in, sel_in, expected, out_1to4);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in_in, sel_in, expected, out_1to4);
            end
        end
    endtask

    // Task to verify dmux_1to8 operation
    task verify_dmux_1to8;
        input in_in;
        input [2:0] sel_in;
        input [7:0] expected;
        begin
            in_1to8 = in_in; sel_1to8 = sel_in;
            #10;
            if (out_1to8 !== expected) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b, got %b", 
                    in_in, sel_in, expected, out_1to8);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b, got %b", 
                    in_in, sel_in, expected, out_1to8);
            end
        end
    endtask

    initial begin
        // Initialize inputs to 0
        in_2to1 = 0; sel_2to1 = 0;
        in_4to1 = 0; sel_4to1 = 2'b00;
        a_8to1 = 0; b_8to1 = 0; c_8to1 = 0; d_8to1 = 0; e_8to1 = 0; f_8to1 = 0; g_8to1 = 0; h_8to1 = 0;
        sel0_8to1 = 0; sel1_8to1 = 0; sel2_8to1 = 0;
        in_1to2 = 0; sel_1to2 = 0;
        in_1to4 = 0; sel_1to4 = 0;
        in_1to8 = 0; sel_1to8 = 0;
        #10;

        // Test mux_2to1
        $display("Testing Mux_2to1");
        verify_mux_2to1(2'b00, 0, 0);  // sel=0, should select a=0
        verify_mux_2to1(2'b01, 0, 1);  // sel=0, should select a=1
        verify_mux_2to1(2'b00, 1, 0);  // sel=0, should select a=1
        verify_mux_2to1(2'b10, 1, 1);  // sel=1, should select b=0

        // Test mux_4to1
        $display("Testing Mux_4to1");
        verify_mux_4to1(4'b0000, 2'b00, 0);  // sel=00, should select a=0
        verify_mux_4to1(4'b0001, 2'b00, 1);  // sel=00, should select a=1
        verify_mux_4to1(4'b0000, 2'b01, 0);  // sel=01, should select b=0
        verify_mux_4to1(4'b0010, 2'b01, 1);  // sel=01, should select b=1
        verify_mux_4to1(4'b0000, 2'b10, 0);  // sel=10, should select c=0
        verify_mux_4to1(4'b0100, 2'b10, 1);  // sel=10, should select c=1
        verify_mux_4to1(4'b0000, 2'b11, 0);  // sel=11, should select c=0
        verify_mux_4to1(4'b1000, 2'b11, 1);  // sel=11, should select c=1

        // Test mux_8to1
        $display("Testing Mux_8to1");
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=0, should select a=0
        verify_mux_8to1(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);  // sel0=0, sel1=0, sel2=0, should select a=1
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select b=0
        verify_mux_8to1(0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);  // sel0=1, sel1=0, sel2=0, should select b=1

        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);  // sel0=0, sel1=1, sel2=0, should select c=0
        verify_mux_8to1(0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1);  // sel0=0, sel1=1, sel2=0, should select c=1
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);  // sel0=1, sel1=1, sel2=0, should select d=0
        verify_mux_8to1(0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1);  // sel0=1, sel1=1, sel2=0, should select d=1

        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=0, sel2=1, should select e=0
        verify_mux_8to1(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1);  // sel0=0, sel1=0, sel2=1, should select e=1
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0);  // sel0=1, sel1=0, sel2=1, should select f=0
        verify_mux_8to1(0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1);  // sel0=1, sel1=0, sel2=1, should select f=1

        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0);  // sel0=0, sel1=1, sel2=1, should select g=0
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1);  // sel0=0, sel1=1, sel2=1, should select g=1
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0);  // sel0=1, sel1=1, sel2=1, should select h=0
        verify_mux_8to1(0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1);  // sel0=1, sel1=1, sel2=1, should select h=1

        // test mux16_2to1
        $display("Testing Mux16_2to1");
        verify_mux16_2to1(16'h0000, 16'hFFFF, 0, 16'h0000);  // select a=0000, expect first input
        verify_mux16_2to1(16'hAAAA, 16'h5555, 0, 16'hAAAA);  // select a=alternating 1010
        verify_mux16_2to1(16'h0000, 16'hFFFF, 1, 16'hFFFF);  // select b=all 1s
        verify_mux16_2to1(16'hFFFF, 16'h0000, 1, 16'h0000);  // select b=all 0s
        verify_mux16_2to1(16'h1234, 16'h5678, 0, 16'h1234);  // select a=specific pattern
        verify_mux16_2to1(16'hABCD, 16'hEF01, 1, 16'hEF01);  // select b=specific pattern

        // Test mux16_4to1
        $display("Testing Mux16_4to1");
        verify_mux16_4to1(16'h0000, 16'hFFFF, 16'hAAAA, 16'h5555, 2'b00, 16'h0000);  // select a=16'h0000
        verify_mux16_4to1(16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 2'b01, 16'hEF01);  // select b=16'hEF01
        verify_mux16_4to1(16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 2'b10, 16'h1234);  // select c=16'h1234
        verify_mux16_4to1(16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 2'b11, 16'h5678);  // select d=16'h5678

        // Test mux16_8to1
        $display("Testing Mux16_8to1");
        verify_mux16_8to1(16'h0010, 16'hFFFF, 16'hAAAA, 16'h5555, 16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 3'b000, 16'h0010);  // select a=16'h0010
        verify_mux16_8to1(16'h0000, 16'hFAFF, 16'hAAAA, 16'h5555, 16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 3'b001, 16'hFAFF);  // select b=16'hFAFF
        verify_mux16_8to1(16'h0000, 16'hFFFF, 16'hABCA, 16'h5555, 16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 3'b010, 16'hABCA);  // select c=16'hABCA
        verify_mux16_8to1(16'h0000, 16'hFFFF, 16'hAAAA, 16'hCCCC, 16'hABCD, 16'hEF01, 16'h1234, 16'h5678, 3'b011, 16'hCCCC);  // select d=16'hCCCC
        verify_mux16_8to1(16'h0000, 16'hFFFF, 16'hAAAA, 16'h5555, 16'h1111, 16'hEF01, 16'h1234, 16'h5678, 3'b100, 16'h1111);  // select e=16h1111'
        verify_mux16_8to1(16'h0000, 16'hFFFF, 16'hAAAA, 16'h5555, 16'hABCD, 16'h2222, 16'h1234, 16'h5678, 3'b101, 16'h2222);  // select f=16'h2222
        verify_mux16_8to1(16'h0000, 16'hFFFF, 16'hAAAA, 16'h5555, 16'hABCD, 16'hEF01, 16'hCCCC, 16'h5678, 3'b110, 16'hCCCC);  // select g=16'hCCCC
        verify_mux16_8to1(16'h0000, 16'hFFFF, 16'hAAAA, 16'h5555, 16'hABCD, 16'hEF01, 16'h1234, 16'h7777, 3'b111, 16'h7777);  // select h=16'h7777

        // Test dmux_1to2
        $display("Testing Dmux_1to2");
        verify_dmux_1to2(0, 0, 2'b00);  // sel=0, should select out0=0
        verify_dmux_1to2(1, 0, 2'b01);  // sel=0, should select out0=1
        verify_dmux_1to2(0, 1, 2'b00);  // sel=1, should select out1=0
        verify_dmux_1to2(1, 1, 2'b10);  // sel=1, should select out1=1

        // Test dmux_1to4
        $display("Testing Dmux_1to4");
        verify_dmux_1to4(0, 2'b00, 4'b0000);  // sel=00, should select out0=0
        verify_dmux_1to4(1, 2'b00, 4'b0001);  // sel=00, should select out0=1
        verify_dmux_1to4(0, 2'b01, 4'b0000);  // sel=01, should select out1=0
        verify_dmux_1to4(1, 2'b01, 4'b0010);  // sel=01, should select out1=1
        verify_dmux_1to4(0, 2'b10, 4'b0000);  // sel=10, should select out2=0
        verify_dmux_1to4(1, 2'b10, 4'b0100);  // sel=10, should select out2=1
        verify_dmux_1to4(0, 2'b11, 4'b0000);  // sel=11, should select out3=0
        verify_dmux_1to4(1, 2'b11, 4'b1000);  // sel=11, should select out3=1

        $display("Testing Dmux_1to8");
        verify_dmux_1to8(0, 3'b000, 8'b00000000);  // sel0=0, sel1=0, sel2=0, should select out0=0
        verify_dmux_1to8(1, 3'b000, 8'b00000001);  // sel0=0, sel1=0, sel2=0, should select out0=1
        verify_dmux_1to8(0, 3'b001, 8'b00000000);  // sel0=1, sel1=0, sel2=0, should select out1=0
        verify_dmux_1to8(1, 3'b001, 8'b00000010);  // sel0=1, sel1=0, sel2=0, should select out1=1

        verify_dmux_1to8(0, 3'b010, 8'b00000000);  // sel0=0, sel1=1, sel2=0, should select out2=0
        verify_dmux_1to8(1, 3'b010, 8'b00000100);  // sel0=0, sel1=1, sel2=0, should select out2=1
        verify_dmux_1to8(0, 3'b011, 8'b00000000);  // sel0=1, sel1=1, sel2=0, should select out3=0
        verify_dmux_1to8(1, 3'b011, 8'b00001000);  // sel0=1, sel1=1, sel2=0, should select out3=1

        verify_dmux_1to8(0, 3'b100, 8'b00000000);  // sel0=0, sel1=0, sel2=1, should select out4=0
        verify_dmux_1to8(1, 3'b100, 8'b00010000);  // sel0=0, sel1=0, sel2=1, should select out4=1
        verify_dmux_1to8(0, 3'b101, 8'b00000000);  // sel0=1, sel1=0, sel2=1, should select out5=0
        verify_dmux_1to8(1, 3'b101, 8'b00100000);  // sel0=1, sel1=0, sel2=1, should select out5=1

        verify_dmux_1to8(0, 3'b110, 8'b00000000);  // sel0=0, sel1=1, sel2=1, should select out6=0
        verify_dmux_1to8(1, 3'b110, 8'b01000000);  // sel0=0, sel1=1, sel2=1, should select out6=1
        verify_dmux_1to8(0, 3'b111, 8'b00000000);  // sel0=1, sel1=1, sel2=1, should select out7=0
        verify_dmux_1to8(1, 3'b111, 8'b10000000);  // sel0=1, sel1=1, sel2=1, should select out7=1

        $finish;
    end

endmodule
