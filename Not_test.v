// Testbench
// Test   |  in   |  out  |
// Test 0 |   0   |   1   |
// Test 1 |   1   |   0   |
`include "Not.v"

module NotTest;

  reg in;
  wire out;
  reg expected;
  reg allPassed;
  
  // Instantiate design under test
  Not NOT(.out(out), .in(in));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: NOT");

    $write("Test 0: ");
    test(0, 1);
    
    $write("Test 1: ");
    test(1, 0);
    
    $display("Finished Test: NOT");
    if (allPassed)
      #1 $display("All tests PASSED");
    else
      #1 $display("Some test has FAILED");
  end
  
  task test (input t_in, t_expected);
    in = t_in;
    expected = t_expected;    
    #1 $write("Input:%0h, Output:%0h, Expected:%0h ", in, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
