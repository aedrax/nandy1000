// Testbench
// Test   | sel |    a     |    b     |   out    |
// Test 0 |  0  | 00000000 | 00000000 | 00000000 |
// Test 1 |  1  | 00000000 | 00000000 | 00000000 |
// Test 2 |  0  | 00000000 | 00010010 | 00000000 |
// Test 3 |  1  | 00000000 | 00010010 | 00010010 |
// Test 4 |  0  | 10011000 | 00000000 | 10011000 |
// Test 5 |  1  | 10011000 | 00000000 | 00000000 |
// Test 6 |  0  | 10101010 | 01010101 | 10101010 |
// Test 7 |  1  | 10101010 | 01010101 | 01010101 |


`include "Mux8bit.v"

module Mux8bitTest;

  reg sel;
  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] out;
  reg [7:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux8bit MUX8BIT(.out(out), .select(sel), .inA(a), .inB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX");

    $write("Test 0: ");
    test( 0, 8'b00000000, 8'b00000000, 8'b00000000);

    $write("Test 1: ");
    test( 1, 8'b00000000, 8'b00000000, 8'b00000000);

    $write("Test 2: ");
    test( 0, 8'b00000000, 8'b00010010, 8'b00000000);

    $write("Test 3: ");
    test( 1, 8'b00000000, 8'b00010010, 8'b00010010);

    $write("Test 4: ");
    test( 0, 8'b10011000, 8'b00000000, 8'b10011000);

    $write("Test 5: ");
    test( 1, 8'b10011000, 8'b00000000, 8'b00000000);

    $write("Test 6: ");
    test( 0, 8'b10101010, 8'b01010101, 8'b10101010);

    $write("Test 7: ");
    test( 1, 8'b10101010, 8'b01010101, 8'b01010101);

    
    #100
    $display("Finished Test: MUX");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input t_sel, [7:0] t_a, t_b, t_expected);
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
