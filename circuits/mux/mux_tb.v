`include "circuits/mux/mux2to1.v"
`include "circuits/mux/mux4to1.v"
`include "circuits/mux/mux8to1.v"

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

    initial begin
        // Initialize inputs
        a2to1 = 0; b2to1 = 0; sel2to1 = 0;
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
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=0, sel2=1, should select b=0
        verify_mux8to1(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);  // sel0=0, sel1=0, sel2=1, should select b=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);  // sel0=0, sel1=1, sel2=0, should select c=0
        verify_mux8to1(0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1);  // sel0=0, sel1=1, sel2=0, should select c=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0);  // sel0=0, sel1=1, sel2=1, should select d=0
        verify_mux8to1(0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1);  // sel0=0, sel1=1, sel2=1, should select d=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0);  // sel0=1, sel1=0, sel2=0, should select e=0
        verify_mux8to1(0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1);  // sel0=1, sel1=0, sel2=0, should select e=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0);  // sel0=1, sel1=0, sel2=1, should select f=0
        verify_mux8to1(0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1);  // sel0=1, sel1=0, sel2=1, should select f=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0);  // sel0=1, sel1=1, sel2=0, should select g=0
        verify_mux8to1(0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1);  // sel0=1, sel1=1, sel2=0, should select g=1
        verify_mux8to1(0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0);  // sel0=1, sel1=1, sel2=1, should select h=0
        verify_mux8to1(0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1);  // sel0=1, sel1=1, sel2=1, should select h=1
        $display("Mux8to1 test completed");
        $finish;
    end

endmodule
