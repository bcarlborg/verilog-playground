module mux_tb();
    // Testbench signals for mux2to1
    reg a2to1, b2to1, sel2to1;  // Inputs are reg for testbench because we want to assign 
                                // different values to them during our test
    wire out2to1;               // Output is wire because it is driven by the UUT
    
    // Instantiate the mux2to1 module as Unit Under Test (UUT)
    mux2to1 uut2to1 (
        .a(a2to1),
        .b(b2to1),
        .sel(sel2to1),
        .out(out2to1)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        a2to1 = 0; b2to1 = 0; sel2to1 = 0;
        #10; // Wait 10 time units
        
        // Test case 1: sel = 0, should select a
        a2to1 = 1; b2to1 = 0; sel2to1 = 0;
        #10;
        if (out2to1 !== 1'b1) $display("ERROR: Test case 1 failed! Expected 1, got %b", out2to1);
        
        // Test case 2: sel = 0, should select a
        a2to1 = 0; b2to1 = 1; sel2to1 = 0;
        #10;
        if (out2to1 !== 1'b0) $display("ERROR: Test case 2 failed! Expected 0, got %b", out2to1);
        
        // Test case 3: sel = 1, should select b
        a2to1 = 0; b2to1 = 1; sel2to1 = 1;
        #10;
        if (out2to1 !== 1'b1) $display("ERROR: Test case 3 failed! Expected 1, got %b", out2to1);
        
        // Test case 4: sel = 1, should select b
        a2to1 = 1; b2to1 = 0; sel2to1 = 1;
        #10;
        if (out2to1 !== 1'b0) $display("ERROR: Test case 4 failed! Expected 0, got %b", out2to1);
        
        // Add monitor statements to display results
        $display("Test completed");
        $finish;
    end
    
    // Optional: Add waveform generation
    initial begin
        $dumpfile("mux_tb.vcd");
        $dumpvars(0, mux_tb);
    end
    
    // Optional: Add monitoring for changes
    initial begin
        $monitor("Time=%0d a=%b b=%b sel=%b out=%b", 
                 $time, a2to1, b2to1, sel2to1, out2to1);
    end

endmodule
