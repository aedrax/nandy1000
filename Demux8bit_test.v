// Testbench
// Test   | sel |    in    |    a     |    b     |
// Test 0 |  0  | 00000000 | 00000000 | 00000000 |
// Test 1 |  1  | 00000000 | 00000000 | 00000000 |
// Test 2 |  0  | 00010010 | 00010010 | 00000000 |
// Test 3 |  1  | 00010010 | 00000000 | 00010010 |
// Test 4 |  0  | 10011000 | 10011000 | 00000000 |
// Test 5 |  1  | 10011000 | 00000000 | 10011000 |
// Test 6 |  0  | 10101010 | 10101010 | 00000000 |
// Test 7 |  1  | 01010101 | 00000000 | 01010101 |

`include "Demux8bit.v"

module Demux8bitTest;

  reg sel;
  reg [7:0] in;
  wire [7:0] a;
  wire [7:0] b;
  reg [7:0] expectedA;
  reg [7:0] expectedB;
  reg allPassed;
  
  // Instantiate design under test
  Demux8bit DEMUX8BIT(.select(sel), .in(in), .outA(a), .outB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: DEMUX8BIT");

    $write("Test 0: ");
    test(0, 8'b00000000, 8'b00000000, 8'b00000000);

    $write("Test 1: ");
    test(1, 8'b00000000, 8'b00000000, 8'b00000000);

    $write("Test 2: ");
    test(0, 8'b00010010, 8'b00010010, 8'b00000000);

    $write("Test 3: ");
    test(1, 8'b00010010, 8'b00000000, 8'b00010010);

    $write("Test 4: ");
    test(0, 8'b10011000, 8'b10011000, 8'b00000000);

    $write("Test 5: ");
    test(1, 8'b10011000, 8'b00000000, 8'b10011000);

    $write("Test 6: ");
    test(0, 8'b10101010, 8'b10101010, 8'b00000000);

    $write("Test 7: ");
    test(1, 8'b01010101, 8'b00000000, 8'b01010101);

    #100
    $display("Finished Test: DEMUX8BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input t_sel, [7:0] t_in, t_expectedA, t_expectedB);
    sel = t_sel;
    in = t_in;
    expectedA = t_expectedA;
    expectedB = t_expectedB;
    #1 $write("Select:%0h, In:%0h, A:%0h, ExpectedA:%0h, B:%0h, ExpectedB:%0h ", sel, in, a, expectedA, b, expectedB);
    if ((a === expectedA) && (b === expectedB))
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
