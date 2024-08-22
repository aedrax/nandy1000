// Testbench
// Test   | a | b |sum|car|
// Test 0 | 0 | 0 | 0 | 0 |
// Test 1 | 0 | 1 | 1 | 0 |
// Test 2 | 1 | 0 | 1 | 0 |
// Test 3 | 1 | 1 | 0 | 1 |
`include "Halfadder.v"

module HalfadderTest;

    // inputs
    reg a;
    reg b;

    // outputs
    wire sum;
    wire carry;
    
    // expected outputs
    reg expected_sum;
    reg expected_carry;

    // flag to indicate if all tests passed
    reg allPassed;
    
    // Instantiate design under test
    Halfadder HA(
        .sum(sum),
        .carry(carry),
        .inA(a),
        .inB(b)
    );

    initial begin
        // Dump waves
        $dumpfile("dump.vcd");
        $dumpvars(1);
        allPassed = 1;    
        $display("Begin Test: Halfadder");

        $write("Test 0: ");
        test(0, 0, 0, 0);
        
        $write("Test 1: ");
        test(0, 1, 1, 0);

        $write("Test 2: ");
        test(1, 0, 1, 0);

        $write("Test 3: ");
        test(1, 1, 0, 1);
        
        #100
        $display("Finished Test: Halfadder");
        if (allPassed)
        $display("All tests PASSED");
        else
        $display("Some test has FAILED");
    end
  
    // Task to test a single vector
    task test;
        input t_inA, t_inB, t_expected_sum, t_expected_carry;
        begin
            a = t_inA;
            b = t_inB;
            expected_sum = t_expected_sum;
            expected_carry = t_expected_carry;
            #1; // Wait for a short delay to allow output to settle
            $write("A:%0b, B:%0b, Sum:%0b, Carry:%0b, Expected Sum:%0b, Expected Carry:%0b ", a, b, sum, carry, expected_sum, expected_carry);
            if (sum === expected_sum && carry === expected_carry)
                $display("[PASSED]");
            else begin
                $display("[FAILED]");
                allPassed = 0;
            end
        end
    endtask

endmodule
