`include "circuits/mux/mux2to1.v"
`include "circuits/mux/mux4to1.v"

module mux_tb();
    // Testbench signals for mux2to1
    reg a2to1, b2to1, sel2to1;
    wire out2to1;
    // Testbench signals for mux4to1
    reg a4to1, b4to1, c4to1, d4to1, sel04to1, sel14to1;
    wire out4to1;

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

    // Task to verify mux operation
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

    // Task to verify mux operation
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

        // Test mux4to1
        verify_mux4to1(0, 0, 0, 0, 0, 0, 0);  // sel0=0, sel1=0, should select a=0
        verify_mux4to1(1, 0, 0, 0, 0, 0, 1);  // sel0=0, sel1=0, should select a=1
        verify_mux4to1(0, 0, 0, 0, 0, 1, 0);  // sel0=0, sel1=1, should select b=0
        verify_mux4to1(0, 1, 0, 0, 0, 1, 1);  // sel0=0, sel1=1, should select b=1
        verify_mux4to1(0, 0, 0, 0, 1, 0, 0);  // sel0=1, sel1=0, should select c=0
        verify_mux4to1(0, 0, 1, 0, 1, 0, 1);  // sel0=1, sel1=0, should select c=1
        $display("Test completed");
        $finish;
    end

endmodule
