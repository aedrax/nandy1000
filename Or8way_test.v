// Testbench
// Test   |     in     | out |
// Test 0 |  00000000  |  0  |
// Test 1 |  11111111  |  1  |
// Test 2 |  00010000  |  1  |
// Test 3 |  00000001  |  1  |
// Test 4 |  00100110  |  1  |
`include "Or8way.v"

module Or8wayTest;

  reg [7:0] in;
  wire out;
  reg expected;
  reg allPassed;
  
  // Instantiate design under test
  Or8way OR8WAY(.out(out), .in(in));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: OR8WAY");

    $write("Test 0: ");
    test(8'b00000000, 0);

    $write("Test 1: ");
    test(8'b11111111, 1);

    $write("Test 2: ");
    test(8'b00010000, 1);

    $write("Test 3: ");
    test(8'b00000001, 1);

    $write("Test 4: ");
    test(8'b00100110, 1);

    
    #100
    $display("Finished Test: OR8WAY");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [7:0] t_in, input t_expected);
    in = t_in;
    expected = t_expected;
    #1 $write("In:%0h, Output:%0h, Expected:%0h ", in, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
