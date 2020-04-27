// Testbench
// Test   |  sel  |   a   |   b   |   c   |   d   |  out  |
// Test 0 |   00  |   0   |   0   |   0   |   0   |   0   |
// Test 1 |   01  |   0   |   0   |   0   |   0   |   0   |
// Test 2 |   10  |   0   |   1   |   1   |   1   |   1   |
// Test 3 |   11  |   0   |   1   |   1   |   1   |   1   |
// Test 4 |   00  |   1   |   0   |   1   |   0   |   1   |
// Test 5 |   01  |   1   |   1   |   0   |   0   |   1   |
// Test 6 |   10  |   1   |   1   |   1   |   1   |   1   |
// Test 7 |   11  |   1   |   1   |   1   |   0   |   0   |

`include "Mux4way.v"

module Mux4wayTest;

  reg [1:0] sel;
  reg a;
  reg b;
  reg c;
  reg d;
  wire out;
  reg expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux4way MUX4WAY(.out(out), .select(sel), .inA(a), .inB(b), .inC(c), .inD(d));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX4WAY");

    $write("Test 0: ");
    test(2'b00, 0, 0, 0, 0, 0);
  
    $write("Test 1: ");
    test(2'b01, 0, 0, 0, 0, 0);
  
    $write("Test 2: ");
    test(2'b10, 0, 1, 1, 1, 1);
  
    $write("Test 3: ");
    test(2'b11, 0, 1, 1, 1, 1);
  
    $write("Test 4: ");
    test(2'b00, 1, 0, 1, 0, 1);
  
    $write("Test 5: ");
    test(2'b01, 1, 1, 0, 0, 1);
  
    $write("Test 6: ");
    test(2'b10, 1, 1, 1, 1, 1);
  
    $write("Test 7: ");
    test(2'b11, 1, 1, 1, 0, 0);
  
    
    #100
    $display("Finished Test: MUX4WAY");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [1:0] t_sel, input t_a, t_b, t_c, t_d, t_expected);
    sel = t_sel;
    a = t_a;
    b = t_b;
    c = t_c;
    d = t_d;
    expected = t_expected;
    #1 $write("Select:%0h, A:%0h, B:%0h, C:%0h, D:%0h, Output:%0h, Expected:%0h ", sel, a, b, c, d, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
