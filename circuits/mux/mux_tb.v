`include "circuits/mux/mux_2to1.v"
`include "circuits/mux/mux_4to1.v"
`include "circuits/mux/mux_8to1.v"
`include "circuits/mux/dmux_1to2.v"
`include "circuits/mux/dmux_1to4.v"
`include "circuits/mux/dmux_1to8.v"
`include "circuits/mux/mux16_2to1.v"

module mux_tb();
    // Testbench signals for mux_2to1
    reg a_2to1, b_2to1, sel_2to1;
    wire out_2to1;

    // Testbench signals for mux_4to1
    reg a_4to1, b_4to1, c_4to1, d_4to1, sel0_4to1, sel1_4to1;
    wire out_4to1;

    // Testbench signals for mux_8to1
    reg a_8to1, b_8to1, c_8to1, d_8to1, e_8to1, f_8to1, g_8to1, h_8to1, sel0_8to1, sel1_8to1, sel2_8to1;
    wire out_8to1;

    // Testbench signals for mux16_2to1
    reg [15:0] a16to1, b16to1;
    reg sel16to1;
    wire [15:0] out16to1;

    // Testbench signals for dmux_1to2
    reg in_1to2, sel_1to2;
    wire out0_1to2, out1_1to2;

    // Testbench signals for dmux_1to4
    reg in_1to4, sel0_1to4, sel1_1to4;
    wire out0_1to4, out1_1to4, out2_1to4, out3_1to4;

    // Testbench signals for dmux_1to8
    reg in_1to8, sel0_1to8, sel1_1to8, sel2_1to8;
    wire out0_1to8, out1_1to8, out2_1to8, out3_1to8, out4_1to8, out5_1to8, out6_1to8, out7_1to8;

    // Instantiate the mux_2to1 module as Unit Under Test (UUT)
    mux_2to1 uut_2to1 (
        .a(a_2to1),
        .b(b_2to1),
        .sel(sel_2to1),
        .out(out_2to1)
    );

    // Instantiate the mux_4to1 module as Unit Under Test (UUT)
    mux_4to1 uut_4to1 (
        .a(a_4to1),
        .b(b_4to1),
        .c(c_4to1),
        .d(d_4to1),
        .sel0(sel0_4to1),
        .sel1(sel1_4to1),
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
    mux16_2to1 uut16to1 (
        .a(a16to1), .b(b16to1), .sel(sel16to1), .out(out16to1)
    );

    // Instantiate the dmux_1to2 module as Unit Under Test (UUT)
    dmux_1to2 uut_1to2 (
        .in(in_1to2),
        .sel(sel_1to2),
        .out0(out0_1to2),
        .out1(out1_1to2)
    );

    // Instantiate the dmux_1to4 module as Unit Under Test (UUT)
    dmux_1to4 uut_1to4 (
        .in(in_1to4),
        .sel0(sel0_1to4),
        .sel1(sel1_1to4),
        .out0(out0_1to4), .out1(out1_1to4), .out2(out2_1to4), .out3(out3_1to4)
    );

    // Instantiate the dmux_1to8 module as Unit Under Test (UUT)
    dmux_1to8 uut_1to8 (
        .in(in_1to8), .sel0(sel0_1to8), .sel1(sel1_1to8), .sel2(sel2_1to8),
        .out0(out0_1to8), .out1(out1_1to8), .out2(out2_1to8), .out3(out3_1to8), .out4(out4_1to8), .out5(out5_1to8), .out6(out6_1to8), .out7(out7_1to8)
    );

    // Task to verify mux_2to1 operation
    task verify_mux_2to1;
        input a_in, b_in, sel_in, expected;
        begin
            a_2to1 = a_in; b_2to1 = b_in; sel_2to1 = sel_in;
            #10;
            if (out_2to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out_2to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out_2to1);
            end
        end
    endtask

    // Task to verify mux_4to1 operation
    task verify_mux_4to1;
        input a_in, b_in, c_in, d_in, sel0_in, sel1_in, expected;
        begin
            a_4to1 = a_in; b_4to1 = b_in; c_4to1 = c_in; d_4to1 = d_in;
            sel0_4to1 = sel0_in; sel1_4to1 = sel1_in;
            #10;
            if (out_4to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b c=%b d=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, sel0_in, sel1_in, expected, out_4to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b c=%b d=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, sel0_in, sel1_in, expected, out_4to1);
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
            a16to1 = a_in; b16to1 = b_in; sel16to1 = sel_in;
            #10;
            if (out16to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out16to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out16to1);
            end
        end
    endtask

    // Task to verify dmux_1to2 operation
    task verify_dmux_1to2;
        input in_in, sel_in, expected0, expected1;
        begin
            in_1to2 = in_in; sel_1to2 = sel_in;
            #10;
            if (out0_1to2 !== expected0 || out1_1to2 !== expected1) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b %b, got %b %b", 
                    in_in, sel_in, expected0, expected1, out0_1to2, out1_1to2);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b %b, got %b %b", 
                    in_in, sel_in, expected0, expected1, out0_1to2, out1_1to2);
            end
        end
    endtask

    // Task to verify dmux_1to4 operation
    task verify_dmux_1to4;
        input in_in, sel0_in, sel1_in, expected0, expected1, expected2, expected3;
        begin
            in_1to4 = in_in; sel0_1to4 = sel0_in; sel1_1to4 = sel1_in;
            #10;
            if (out0_1to4 !== expected0 || out1_1to4 !== expected1 || out2_1to4 !== expected2 || out3_1to4 !== expected3) begin
                $display("[TEST FAILED] in=%b sel0=%b sel1=%b: Expected %b %b %b %b, got %b %b %b %b", 
                    in_in, sel0_in, sel1_in, expected0, expected1, expected2, expected3, out0_1to4, out1_1to4, out2_1to4, out3_1to4);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel0=%b sel1=%b: Expected %b %b %b %b, got %b %b %b %b", 
                    in_in, sel0_in, sel1_in, expected0, expected1, expected2, expected3, out0_1to4, out1_1to4, out2_1to4, out3_1to4);
            end
        end
    endtask

    // Task to verify dmux_1to8 operation
    task verify_dmux_1to8;
        input in_in, sel0_in, sel1_in, sel2_in, expected0, expected1, expected2, expected3, expected4, expected5, expected6, expected7; 
        begin
            in_1to8 = in_in; sel0_1to8 = sel0_in; sel1_1to8 = sel1_in; sel2_1to8 = sel2_in;
            #10;
            if (out0_1to8 !== expected0 || out1_1to8 !== expected1 || out2_1to8 !== expected2 || out3_1to8 !== expected3 || out4_1to8 !== expected4 || out5_1to8 !== expected5 || out6_1to8 !== expected6 || out7_1to8 !== expected7) begin
                $display("[TEST FAILED] in=%b sel0=%b sel1=%b sel2=%b: Expected %b %b %b %b %b %b %b %b, got %b %b %b %b %b %b %b %b", 
                    in_in, sel0_in, sel1_in, sel2_in, expected0, expected1, expected2, expected3, expected4, expected5, expected6, expected7, out0_1to8, out1_1to8, out2_1to8, out3_1to8, out4_1to8, out5_1to8, out6_1to8, out7_1to8);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel0=%b sel1=%b sel2=%b: Expected %b %b %b %b %b %b %b %b, got %b %b %b %b %b %b %b %b", 
                    in_in, sel0_in, sel1_in, sel2_in, expected0, expected1, expected2, expected3, expected4, expected5, expected6, expected7, out0_1to8, out1_1to8, out2_1to8, out3_1to8, out4_1to8, out5_1to8, out6_1to8, out7_1to8);
            end
        end
    endtask

    initial begin
        // Initialize inputs to 0
        a_2to1 = 0; b_2to1 = 0; sel_2to1 = 0;
        a_4to1 = 0; b_4to1 = 0; c_4to1 = 0; d_4to1 = 0; sel0_4to1 = 0; sel1_4to1 = 0;
        a_8to1 = 0; b_8to1 = 0; c_8to1 = 0; d_8to1 = 0; e_8to1 = 0; f_8to1 = 0; g_8to1 = 0; h_8to1 = 0;
        sel0_8to1 = 0; sel1_8to1 = 0; sel2_8to1 = 0;
        in_1to2 = 0; sel_1to2 = 0;
        in_1to4 = 0; sel0_1to4 = 0; sel1_1to4 = 0;
        #10;

        // Test mux_2to1
        verify_mux_2to1(0, 0, 0, 0);  // sel=0, should select a=0
        verify_mux_2to1(0, 1, 0, 0);  // sel=0, should select a=0
        verify_mux_2to1(1, 0, 0, 1);  // sel=0, should select a=1
        verify_mux_2to1(1, 1, 0, 1);  // sel=0, should select a=1
        verify_mux_2to1(0, 0, 1, 0);  // sel=1, should select b=0
        verify_mux_2to1(1, 0, 1, 0);  // sel=1, should select b=0
        verify_mux_2to1(0, 1, 1, 1);  // sel=1, should select b=1
        verify_mux_2to1(1, 1, 1, 1);  // sel=1, should select b=1
        $display("Mux_2to1 test completed");

        // Test mux_4to1
        verify_mux_4to1(0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, should select a=0
        verify_mux_4to1(1, 0, 0, 0, 0, 0, 1);  // sel0=0, sel1=0, should select a=1
        verify_mux_4to1(0, 0, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, should select b=0
        verify_mux_4to1(0, 1, 0, 0, 1, 0, 1);  // sel0=1, sel1=0, should select b=1
        verify_mux_4to1(0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=1, should select c=0
        verify_mux_4to1(0, 0, 1, 0, 0, 1, 1);  // sel0=0, sel1=1, should select c=1
        verify_mux_4to1(0, 0, 0, 0, 1, 1, 0);  // sel0=1, sel1=1, should select c=0
        verify_mux_4to1(0, 0, 0, 1, 1, 1, 1);  // sel0=1, sel1=1, should select c=1
        $display("Mux_4to1 test completed");

        // Test mux_8to1
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
        $display("Mux_8to1 test completed");

        // test mux16_2to1
        verify_mux16_2to1(16'h0000, 16'hFFFF, 0, 16'h0000);  // select a=0000, expect first input
        verify_mux16_2to1(16'hAAAA, 16'h5555, 0, 16'hAAAA);  // select a=alternating 1010
        verify_mux16_2to1(16'h0000, 16'hFFFF, 1, 16'hFFFF);  // select b=all 1s
        verify_mux16_2to1(16'hFFFF, 16'h0000, 1, 16'h0000);  // select b=all 0s
        verify_mux16_2to1(16'h1234, 16'h5678, 0, 16'h1234);  // select a=specific pattern
        verify_mux16_2to1(16'hABCD, 16'hEF01, 1, 16'hEF01);  // select b=specific pattern
        $display("Mux16_2to1 test completed");

        // Test dmux_1to2
        verify_dmux_1to2(0, 0, 0, 0);  // sel=0, should select out0=0
        verify_dmux_1to2(1, 0, 1, 0);  // sel=0, should select out0=1
        verify_dmux_1to2(0, 1, 0, 0);  // sel=1, should select out1=0
        verify_dmux_1to2(1, 1, 0, 1);  // sel=1, should select out1=1
        $display("Dmux_1to2 test completed");

        // Test dmux_1to4
        verify_dmux_1to4(0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, should select out0=0
        verify_dmux_1to4(1, 0, 0, 1, 0, 0, 0);  // sel0=0, sel1=0, should select out0=1
        verify_dmux_1to4(0, 1, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, should select out1=0
        verify_dmux_1to4(1, 1, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, should select out1=1
        verify_dmux_1to4(0, 0, 1, 0, 0, 0, 0);  // sel0=0, sel1=1, should select out3=0
        verify_dmux_1to4(1, 0, 1, 0, 0, 1, 0);  // sel0=0, sel1=1, should select out3=1
        verify_dmux_1to4(0, 1, 1, 0, 0, 0, 0);  // sel0=1, sel1=1, should select out4=0
        verify_dmux_1to4(1, 1, 1, 0, 0, 0, 1);  // sel0=1, sel1=1, should select out4=1
        $display("Dmux_1to4 test completed!");

        // Test dmux_1to8
        verify_dmux_1to8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=0, should select out0=0
        verify_dmux_1to8(1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=0, should select out0=1
        verify_dmux_1to8(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select out1=0
        verify_dmux_1to8(1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select out1=1

        verify_dmux_1to8(0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=1, sel2=0, should select out2=0
        verify_dmux_1to8(1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0);  // sel0=0, sel1=1, sel2=0, should select out2=1
        verify_dmux_1to8(0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=1, sel2=0, should select out3=0
        verify_dmux_1to8(1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0);  // sel0=1, sel1=1, sel2=0, should select out3=1

        verify_dmux_1to8(0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=1, should select out4=0
        verify_dmux_1to8(1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0);  // sel0=0, sel1=0, sel2=1, should select out4=1
        verify_dmux_1to8(0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, sel2=1, should select out5=0
        verify_dmux_1to8(1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, sel2=1, should select out5=1

        verify_dmux_1to8(0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=1, sel2=1, should select out6=0
        verify_dmux_1to8(1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=1, sel2=1, should select out6=1
        verify_dmux_1to8(0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=1, sel2=1, should select out7=0
        verify_dmux_1to8(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1);  // sel0=1, sel1=1, sel2=1, should select out7=1
        $display("Dmux_1to8 test completed!");

        $finish;
    end

endmodule
