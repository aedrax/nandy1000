// Testbench
// Test   | sel  | in  |  a  |  b  |  c  |  d  |
// Test 0 |  00  |  0  |  0  |  0  |  0  |  0  |
// Test 1 |  01  |  0  |  0  |  0  |  0  |  0  |
// Test 2 |  10  |  0  |  0  |  0  |  0  |  0  |
// Test 3 |  11  |  0  |  0  |  0  |  0  |  0  |
// Test 4 |  00  |  1  |  1  |  0  |  0  |  0  |
// Test 5 |  01  |  1  |  0  |  1  |  0  |  0  |
// Test 6 |  10  |  1  |  0  |  0  |  1  |  0  |
// Test 7 |  11  |  1  |  0  |  0  |  0  |  1  |


`include "Demux4way.v"

module Demux4wayTest;

  reg [1:0] sel;
  reg in;
  wire a;
  wire b;
  wire c;
  wire d;
  reg expectedA;
  reg expectedB;
  reg expectedC;
  reg expectedD;
  reg allPassed;
  
  // Instantiate design under test
  Demux4way DEMUX4WAY(.select(sel), .in(in), .outA(a), .outB(b), .outC(c), .outD(d));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: DEMUX4WAY");

    $write("Test 0: ");
    test(2'b00, 0, 0, 0, 0, 0);

    $write("Test 1: ");
    test(2'b01, 0, 0, 0, 0, 0);

    $write("Test 2: ");
    test(2'b10, 0, 0, 0, 0, 0);

    $write("Test 3: ");
    test(2'b11, 0, 0, 0, 0, 0);

    $write("Test 4: ");
    test(2'b00, 1, 1, 0, 0, 0);

    $write("Test 5: ");
    test(2'b01, 1, 0, 1, 0, 0);

    $write("Test 6: ");
    test(2'b10, 1, 0, 0, 1, 0);

    $write("Test 7: ");
    test(2'b11, 1, 0, 0, 0, 1);


    #100
    $display("Finished Test: DEMUX4WAY");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [1:0] t_sel, input t_in, t_expectedA, t_expectedB, t_expectedC, t_expectedD);
    sel = t_sel;
    in = t_in;
    expectedA = t_expectedA;
    expectedB = t_expectedB;
    expectedC = t_expectedC;
    expectedD = t_expectedD;
    #1 $write("Select:%0h, In:%0h, A:%0h, ExpectedA:%0h, B:%0h, ExpectedB:%0h, C:%0h, ExpectedC:%0h, D:%0h, ExpectedD:%0h ",
              sel, in, a, expectedA, b, expectedB, c, expectedC, d, expectedD);
    if ((a === expectedA) && (b === expectedB) && (c === expectedC) && (d === expectedD))
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
