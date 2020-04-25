// Testbench
// Test   | sel |        a         |        b         |       out        |
// Test 0 |  0  | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 1 |  1  | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 2 |  0  | 0000000000000000 | 0001001000110100 | 0000000000000000 |
// Test 3 |  1  | 0000000000000000 | 0001001000110100 | 0001001000110100 |
// Test 4 |  0  | 1001100001110110 | 0000000000000000 | 1001100001110110 |
// Test 5 |  1  | 1001100001110110 | 0000000000000000 | 0000000000000000 |
// Test 6 |  0  | 1010101010101010 | 0101010101010101 | 1010101010101010 |
// Test 7 |  1  | 1010101010101010 | 0101010101010101 | 0101010101010101 |



`include "Mux16bit.v"

module Mux16bitTest;

  reg sel;
  reg [15:0] a;
  reg [15:0] b;
  wire [15:0] out;
  reg [15:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux16bit MUX16BIT(.out(out), .select(sel), .inA(a), .inB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX16BIT");

    $write("Test 0: ");
    test(0, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 1: ");
    test(1, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 2: ");
    test(0, 16'b0000000000000000, 16'b0001001000110100, 16'b0000000000000000);

    $write("Test 3: ");
    test(1, 16'b0000000000000000, 16'b0001001000110100, 16'b0001001000110100);

    $write("Test 4: ");
    test(0, 16'b1001100001110110, 16'b0000000000000000, 16'b1001100001110110);

    $write("Test 5: ");
    test(1, 16'b1001100001110110, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 6: ");
    test(0, 16'b1010101010101010, 16'b0101010101010101, 16'b1010101010101010);

    $write("Test 7: ");
    test(1, 16'b1010101010101010, 16'b0101010101010101, 16'b0101010101010101);

    
    #100
    $display("Finished Test: MUX16BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input t_sel, [15:0] t_a, t_b, t_expected);
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
