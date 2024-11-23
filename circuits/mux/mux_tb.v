`include "circuits/mux/mux2to1.v"
`include "circuits/mux/mux4to1.v"
`include "circuits/mux/mux8to1.v"
`include "circuits/mux/dmux1to2.v"
`include "circuits/mux/dmux1to4.v"
`include "circuits/mux/dmux1to8.v"

module mux_tb();
    // Testbench signals for mux2to1
    reg a2to1, b2to1, sel2to1;
    wire out2to1;

    // Testbench signals for mux4to1
    reg a4to1, b4to1, c4to1, d4to1, sel04to1, sel14to1;
    wire out4to1;

    // Testbench signals for mux8to1
    reg a8to1, b8to1, c8to1, d8to1, e8to1, f8to1, g8to1, h8to1, sel08to1, sel18to1, sel28to1;
    wire out8to1;

    // Testbench signals for dmux1to2
    reg in1to2, sel1to2;
    wire out01to2, out11to2;

    // Testbench signals for dmux1to4
    reg in1to4, sel01to4, sel11to4;
    wire out01to4, out11to4, out21to4, out31to4;

    // Testbench signals for dmux1to8
    reg in1to8, sel01to8, sel11to8, sel21to8;
    wire out01to8, out11to8, out21to8, out31to8, out41to8, out51to8, out61to8, out71to8;

    // Instantiate the mux2to1 module as Unit Under Test (UUT)
    mux2to1 uut2to1 (
        .a(a2to1),
        .b(b2to1),
        .sel(sel2to1),
        .out(out2to1)
    );

    // Instantiate the mux4to1 module as Unit Under Test (UUT)
    mux4to1 uut4to1 (
        .a(a4to1),
        .b(b4to1),
        .c(c4to1),
        .d(d4to1),
        .sel0(sel04to1),
        .sel1(sel14to1),
        .out(out4to1)
    );

    // Instantiate the mux8to1 module as Unit Under Test (UUT)
    mux8to1 uut8to1 (
        .a(a8to1),
        .b(b8to1),
        .c(c8to1),
        .d(d8to1),
        .e(e8to1),
        .f(f8to1),
        .g(g8to1),
        .h(h8to1),
        .sel0(sel08to1),
        .sel1(sel18to1),
        .sel2(sel28to1),
        .out(out8to1)
    );

    // Instantiate the dmux1to2 module as Unit Under Test (UUT)
    dmux1to2 uut1to2 (
        .in(in1to2),
        .sel(sel1to2),
        .out0(out01to2),
        .out1(out11to2)
    );

    // Instantiate the dmux1to4 module as Unit Under Test (UUT)
    dmux1to4 uut1to4 (
        .in(in1to4),
        .sel0(sel01to4),
        .sel1(sel11to4),
        .out0(out01to4), .out1(out11to4), .out2(out21to4), .out3(out31to4)
    );

    // Instantiate the dmux1to8 module as Unit Under Test (UUT)
    dmux1to8 uut1to8 (
        .in(in1to8), .sel0(sel01to8), .sel1(sel11to8), .sel2(sel21to8),
        .out0(out01to8), .out1(out11to8), .out2(out21to8), .out3(out31to8), .out4(out41to8), .out5(out51to8), .out6(out61to8), .out7(out71to8)
    );

    // Task to verify mux2to1 operation
    task verify_mux2to1;
        input a_in, b_in, sel_in, expected;
        begin
            a2to1 = a_in; b2to1 = b_in; sel2to1 = sel_in;
            #10;
            if (out2to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out2to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b sel=%b: Expected %b, got %b", 
                    a_in, b_in, sel_in, expected, out2to1);
            end
        end
    endtask

    // Task to verify mux4to1 operation
    task verify_mux4to1;
        input a_in, b_in, c_in, d_in, sel0_in, sel1_in, expected;
        begin
            a4to1 = a_in; b4to1 = b_in; c4to1 = c_in; d4to1 = d_in;
            sel04to1 = sel0_in; sel14to1 = sel1_in;
            #10;
            if (out4to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b c=%b d=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, sel0_in, sel1_in, expected, out4to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b c=%b d=%b sel0=%b sel1=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, sel0_in, sel1_in, expected, out4to1);
            end
        end
    endtask

    // Task to verify mux8to1 operation
    task verify_mux8to1;
        input a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel0_in, sel1_in, sel2_in, expected;
        begin
            a8to1 = a_in; b8to1 = b_in; c8to1 = c_in; d8to1 = d_in; e8to1 = e_in; f8to1 = f_in; g8to1 = g_in; h8to1 = h_in;
            sel08to1 = sel0_in; sel18to1 = sel1_in; sel28to1 = sel2_in;
            #10;
            if (out8to1 !== expected) begin
                $display("[TEST FAILED] a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel0=%b sel1=%b sel2=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel0_in, sel1_in, sel2_in, expected, out8to1);
                $finish;
            end else begin
                $display("[TEST PASSED] a=%b b=%b c=%b d=%b e=%b f=%b g=%b h=%b sel0=%b sel1=%b sel2=%b: Expected %b, got %b", 
                    a_in, b_in, c_in, d_in, e_in, f_in, g_in, h_in, sel0_in, sel1_in, sel2_in, expected, out8to1);
            end
        end
    endtask

    // Task to verify dmux1to2 operation
    task verify_dmux1to2;
        input in_in, sel_in, expected0, expected1;
        begin
            in1to2 = in_in; sel1to2 = sel_in;
            #10;
            if (out01to2 !== expected0 || out11to2 !== expected1) begin
                $display("[TEST FAILED] in=%b sel=%b: Expected %b %b, got %b %b", 
                    in_in, sel_in, expected0, expected1, out01to2, out11to2);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel=%b: Expected %b %b, got %b %b", 
                    in_in, sel_in, expected0, expected1, out01to2, out11to2);
            end
        end
    endtask

    // Task to verify dmux1to4 operation
    task verify_dmux1to4;
        input in_in, sel0_in, sel1_in, expected0, expected1, expected2, expected3;
        begin
            in1to4 = in_in; sel01to4 = sel0_in; sel11to4 = sel1_in;
            #10;
            if (out01to4 !== expected0 || out11to4 !== expected1 || out21to4 !== expected2 || out31to4 !== expected3) begin
                $display("[TEST FAILED] in=%b sel0=%b sel1=%b: Expected %b %b %b %b, got %b %b %b %b", 
                    in_in, sel0_in, sel1_in, expected0, expected1, expected2, expected3, out01to4, out11to4, out21to4, out31to4);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel0=%b sel1=%b: Expected %b %b %b %b, got %b %b %b %b", 
                    in_in, sel0_in, sel1_in, expected0, expected1, expected2, expected3, out01to4, out11to4, out21to4, out31to4);
            end
        end
    endtask

    // Task to verify dmux1to8 operation
    task verify_dmux1to8;
        input in_in, sel0_in, sel1_in, sel2_in, expected0, expected1, expected2, expected3, expected4, expected5, expected6, expected7; 
        begin
            in1to8 = in_in; sel01to8 = sel0_in; sel11to8 = sel1_in; sel21to8 = sel2_in;
            #10;
            if (out01to8 !== expected0 || out11to8 !== expected1 || out21to8 !== expected2 || out31to8 !== expected3 || out41to8 !== expected4 || out51to8 !== expected5 || out61to8 !== expected6 || out71to8 !== expected7) begin
                $display("[TEST FAILED] in=%b sel0=%b sel1=%b sel2=%b: Expected %b %b %b %b %b %b %b %b, got %b %b %b %b %b %b %b %b", 
                    in_in, sel0_in, sel1_in, sel2_in, expected0, expected1, expected2, expected3, expected4, expected5, expected6, expected7, out01to8, out11to8, out21to8, out31to8, out41to8, out51to8, out61to8, out71to8);
                $finish;
            end else begin
                $display("[TEST PASSED] in=%b sel0=%b sel1=%b sel2=%b: Expected %b %b %b %b %b %b %b %b, got %b %b %b %b %b %b %b %b", 
                    in_in, sel0_in, sel1_in, sel2_in, expected0, expected1, expected2, expected3, expected4, expected5, expected6, expected7, out01to8, out11to8, out21to8, out31to8, out41to8, out51to8, out61to8, out71to8);
            end
        end
    endtask

    initial begin
        // Initialize inputs to 0
        a2to1 = 0; b2to1 = 0; sel2to1 = 0;
        a4to1 = 0; b4to1 = 0; c4to1 = 0; d4to1 = 0; sel04to1 = 0; sel14to1 = 0;
        a8to1 = 0; b8to1 = 0; c8to1 = 0; d8to1 = 0; e8to1 = 0; f8to1 = 0; g8to1 = 0; h8to1 = 0;
        sel08to1 = 0; sel18to1 = 0; sel28to1 = 0;
        in1to2 = 0; sel1to2 = 0;
        in1to4 = 0; sel01to4 = 0; sel11to4 = 0;
        #10;

        // Test mux2to1
        verify_mux2to1(0, 0, 0, 0);  // sel=0, should select a=0
        verify_mux2to1(0, 1, 0, 0);  // sel=0, should select a=0
        verify_mux2to1(1, 0, 0, 1);  // sel=0, should select a=1
        verify_mux2to1(1, 1, 0, 1);  // sel=0, should select a=1
        verify_mux2to1(0, 0, 1, 0);  // sel=1, should select b=0
        verify_mux2to1(1, 0, 1, 0);  // sel=1, should select b=0
        verify_mux2to1(0, 1, 1, 1);  // sel=1, should select b=1
        verify_mux2to1(1, 1, 1, 1);  // sel=1, should select b=1
        $display("Mux2to1 test completed");

        // Test mux4to1
        verify_mux4to1(0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, should select a=0
        verify_mux4to1(1, 0, 0, 0, 0, 0, 1);  // sel0=0, sel1=0, should select a=1
        verify_mux4to1(0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=1, should select b=0
        verify_mux4to1(0, 1, 0, 0, 0, 1, 1);  // sel0=0, sel1=1, should select b=1
        verify_mux4to1(0, 0, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, should select c=0
        verify_mux4to1(0, 0, 1, 0, 1, 0, 1);  // sel0=1, sel1=0, should select c=1
        verify_mux4to1(0, 0, 0, 0, 1, 1, 0);  // sel0=1, sel1=0, should select c=0
        verify_mux4to1(0, 0, 1, 1, 1, 1, 1);  // sel0=1, sel1=0, should select c=1
        $display("Mux4to1 test completed");

        // Test mux8to1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=0, should select a=0
        verify_mux8to1(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);  // sel0=0, sel1=0, sel2=0, should select a=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select b=0
        verify_mux8to1(0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1);  // sel0=1, sel1=0, sel2=0, should select b=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);  // sel0=0, sel1=1, sel2=0, should select c=0
        verify_mux8to1(0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1);  // sel0=0, sel1=1, sel2=0, should select c=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);  // sel0=1, sel1=1, sel2=0, should select d=0
        verify_mux8to1(0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 1);  // sel0=1, sel1=1, sel2=0, should select d=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=0, sel2=1, should select e=0
        verify_mux8to1(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1);  // sel0=0, sel1=0, sel2=1, should select e=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0);  // sel0=1, sel1=0, sel2=1, should select f=0
        verify_mux8to1(0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1);  // sel0=1, sel1=0, sel2=1, should select f=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0);  // sel0=0, sel1=1, sel2=1, should select g=0
        verify_mux8to1(0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1);  // sel0=0, sel1=1, sel2=1, should select g=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0);  // sel0=1, sel1=1, sel2=1, should select h=0
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1);  // sel0=1, sel1=1, sel2=1, should select h=1
        $display("Mux8to1 test completed");

        // Test dmux1to2
        verify_dmux1to2(0, 0, 0, 0);  // sel=0, should select out0=0
        verify_dmux1to2(1, 0, 1, 0);  // sel=0, should select out0=1
        verify_dmux1to2(0, 1, 0, 0);  // sel=1, should select out1=0
        verify_dmux1to2(1, 1, 0, 1);  // sel=1, should select out1=1
        $display("Dmux1to2 test completed");

        // Test dmux1to4
        verify_dmux1to4(0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, should select out0=0
        verify_dmux1to4(1, 0, 0, 1, 0, 0, 0);  // sel0=0, sel1=0, should select out0=1
        verify_dmux1to4(0, 1, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, should select out1=0
        verify_dmux1to4(1, 1, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, should select out1=1
        verify_dmux1to4(0, 0, 1, 0, 0, 0, 0);  // sel0=0, sel1=1, should select out3=0
        verify_dmux1to4(1, 0, 1, 0, 0, 1, 0);  // sel0=0, sel1=1, should select out3=1
        verify_dmux1to4(0, 1, 1, 0, 0, 0, 0);  // sel0=1, sel1=1, should select out4=0
        verify_dmux1to4(1, 1, 1, 0, 0, 0, 1);  // sel0=1, sel1=1, should select out4=1
        $display("Dmux1to4 test completed!");

        // Test dmux1to8
        verify_dmux1to8(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=0, should select out0=0
        verify_dmux1to8(1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=0, should select out0=1
        verify_dmux1to8(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select out1=0
        verify_dmux1to8(1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select out1=1

        verify_dmux1to8(0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=1, sel2=0, should select out2=0
        verify_dmux1to8(1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0);  // sel0=0, sel1=1, sel2=0, should select out2=1
        verify_dmux1to8(0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=1, sel2=0, should select out3=0
        verify_dmux1to8(1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0);  // sel0=1, sel1=1, sel2=0, should select out3=1

        verify_dmux1to8(0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, sel2=1, should select out4=0
        verify_dmux1to8(1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0);  // sel0=0, sel1=0, sel2=1, should select out4=1
        verify_dmux1to8(0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=0, sel2=1, should select out5=0
        verify_dmux1to8(1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, sel2=1, should select out5=1

        verify_dmux1to8(0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=1, sel2=1, should select out6=0
        verify_dmux1to8(1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=1, sel2=1, should select out6=1
        verify_dmux1to8(0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0);  // sel0=1, sel1=1, sel2=1, should select out7=0
        verify_dmux1to8(1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1);  // sel0=1, sel1=1, sel2=1, should select out7=1
        $display("Dmux1to8 test completed!");

        $finish;
    end

endmodule
