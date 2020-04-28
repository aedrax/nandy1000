// Testbench
// Test    |  sel  | in  |  a  |  b  |  c  |  d  |  e  |  f  |  g  |  h  |
// Test 00 |  000  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 01 |  001  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 02 |  010  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 03 |  011  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 04 |  100  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 05 |  101  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 06 |  110  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 07 |  111  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 08 |  000  |  1  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 09 |  001  |  1  |  0  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |
// Test 10 |  010  |  1  |  0  |  0  |  1  |  0  |  0  |  0  |  0  |  0  |
// Test 11 |  011  |  1  |  0  |  0  |  0  |  1  |  0  |  0  |  0  |  0  |
// Test 12 |  100  |  1  |  0  |  0  |  0  |  0  |  1  |  0  |  0  |  0  |
// Test 13 |  101  |  1  |  0  |  0  |  0  |  0  |  0  |  1  |  0  |  0  |
// Test 14 |  110  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |  1  |  0  |
// Test 15 |  111  |  1  |  0  |  0  |  0  |  0  |  0  |  0  |  0  |  1  |


`include "Demux8way.v"

module Demux8wayTest;

  reg [2:0] sel;
  reg in;
  wire a;
  wire b;
  wire c;
  wire d;
  wire e;
  wire f;
  wire g;
  wire h;
  reg expectedA;
  reg expectedB;
  reg expectedC;
  reg expectedD;
  reg expectedE;
  reg expectedF;
  reg expectedG;
  reg expectedH;
  reg allPassed;
  
  // Instantiate design under test
  Demux8way DEMUX8WAY(.select(sel), .in(in),
                      .outA(a), .outB(b), .outC(c), .outD(d),
                      .outE(e), .outF(f), .outG(g), .outH(h));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: DEMUX8WAY");

    $write("Test 00: ");
    test(3'b000, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 01: ");
    test(3'b001, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 02: ");
    test(3'b010, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 03: ");
    test(3'b011, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 04: ");
    test(3'b100, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 05: ");
    test(3'b101, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 06: ");
    test(3'b110, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 07: ");
    test(3'b111, 0, 0, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 08: ");
    test(3'b000, 1, 1, 0, 0, 0, 0, 0, 0, 0);

    $write("Test 09: ");
    test(3'b001, 1, 0, 1, 0, 0, 0, 0, 0, 0);

    $write("Test 10: ");
    test(3'b010, 1, 0, 0, 1, 0, 0, 0, 0, 0);

    $write("Test 11: ");
    test(3'b011, 1, 0, 0, 0, 1, 0, 0, 0, 0);

    $write("Test 12: ");
    test(3'b100, 1, 0, 0, 0, 0, 1, 0, 0, 0);

    $write("Test 13: ");
    test(3'b101, 1, 0, 0, 0, 0, 0, 1, 0, 0);

    $write("Test 14: ");
    test(3'b110, 1, 0, 0, 0, 0, 0, 0, 1, 0);

    $write("Test 15: ");
    test(3'b111, 1, 0, 0, 0, 0, 0, 0, 0, 1);



    #100
    $display("Finished Test: DEMUX8WAY");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [2:0] t_sel, input t_in,
            t_expectedA, t_expectedB, t_expectedC, t_expectedD,
            t_expectedE, t_expectedF, t_expectedG, t_expectedH);
    sel = t_sel;
    in = t_in;
    expectedA = t_expectedA;
    expectedB = t_expectedB;
    expectedC = t_expectedC;
    expectedD = t_expectedD;
    expectedE = t_expectedE;
    expectedF = t_expectedF;
    expectedG = t_expectedG;
    expectedH = t_expectedH;
    #1
    $write("Select:%0h, In:%0h, A:%0h, ExpectedA:%0h, B:%0h, ExpectedB:%0h, C:%0h, ExpectedC:%0h, D:%0h, ExpectedD:%0h ",
           sel, in, a, expectedA, b, expectedB, c, expectedC, d, expectedD);
    $write("E:%0h, ExpectedE:%0h, F:%0h, ExpectedF:%0h, G:%0h, ExpectedG:%0h, H:%0h, ExpectedH:%0h ",
           e, expectedE, f, expectedF, g, expectedG, h, expectedH);
    if ((a === expectedA) && (b === expectedB) && (c === expectedC) && (d === expectedD) &&
        (e === expectedE) && (f === expectedF) && (g === expectedG) && (h === expectedH))
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
