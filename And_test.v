// Testbench
// Test   |   a   |   b   |  out  |
// Test 0 |   0   |   0   |   0   |
// Test 1 |   0   |   1   |   0   |
// Test 2 |   1   |   0   |   0   |
// Test 3 |   1   |   1   |   1   |
`include "And.v"

module AndTest;

  reg a;
  reg b;
  wire out;
  reg expected;
  reg allPassed;
  
  // Instantiate design under test
  And AND(.out(out), .inA(a), .inB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: AND");

    $write("Test 0: ");
    test(0, 0, 0);
    
    $write("Test 1: ");
    test(0, 1, 0);

    $write("Test 2: ");
    test(1, 0, 0);

    $write("Test 3: ");
    test(1, 1, 1);
    
    #100
    $display("Finished Test: AND");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input t_a, t_b, t_expected);
    a = t_a;
    b = t_b;
    expected = t_expected;
    #1 $write("A:%0h, B:%0h, Output:%0h, Expected:%0h ", a, b, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
