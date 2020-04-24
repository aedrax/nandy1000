// Testbench
// Test   |  sel  |   a   |   b   |  out  |
// Test 0 |   0   |   0   |   0   |   0   |
// Test 1 |   1   |   0   |   0   |   0   |
// Test 2 |   0   |   0   |   1   |   0   |
// Test 3 |   1   |   0   |   1   |   1   |
// Test 4 |   0   |   1   |   0   |   1   |
// Test 5 |   1   |   1   |   0   |   0   |
// Test 6 |   0   |   1   |   1   |   1   |
// Test 7 |   1   |   1   |   1   |   1   |

`include "Mux.v"

module MuxTest;

  reg sel;
  reg a;
  reg b;
  wire out;
  reg expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux MUX(.out(out), .select(sel), .inA(a), .inB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX");

    $write("Test 0: ");
    test(0, 0, 0, 0);

    $write("Test 1: ");
    test(1, 0, 0, 0);

    $write("Test 2: ");
    test(0, 0, 1, 0);

    $write("Test 3: ");
    test(1, 0, 1, 1);

    $write("Test 4: ");
    test(0, 1, 0, 1);

    $write("Test 5: ");
    test(1, 1, 0, 0);

    $write("Test 6: ");
    test(0, 1, 1, 1);

    $write("Test 7: ");
    test(1, 1, 1, 1);

    
    #100
    $display("Finished Test: MUX");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input t_sel, t_a, t_b, t_expected);
    sel = t_sel;
    a = t_a;
    b = t_b;    
    expected = t_expected;
    #1 $write("Select:%0h, A:%0h, B:%0h, Output:%0h, Expected:%0h ", sel, a, b, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
