`include "circuits/mux/mux2to1.v"
module mux_tb();
    // Testbench signals for mux2to1
    reg a2to1, b2to1, sel2to1;
    wire out2to1;

    // Instantiate the mux2to1 module as Unit Under Test (UUT)
    mux2to1 uut2to1 (
        .a(a2to1),
        .b(b2to1),
        .sel(sel2to1),
        .out(out2to1)
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

        $display("Test completed");
        $finish;
    end

    // Optional: Add monitoring for changes
    initial begin
        $monitor("Time=%0d a=%b b=%b sel=%b out=%b", 
                 $time, a2to1, b2to1, sel2to1, out2to1);
    end

endmodule
