// Testbench
// Test   |  sel  |  in   |   a   |   b   |
// Test 0 |   0   |   0   |   0   |   0   |
// Test 1 |   1   |   0   |   0   |   0   |
// Test 2 |   0   |   1   |   1   |   0   |
// Test 3 |   1   |   1   |   0   |   1   |

`include "Demux.v"

module DemuxTest;

  reg sel;
  reg in;
  wire a;
  wire b;
  reg expectedA;
  reg expectedB;
  reg allPassed;
  
  // Instantiate design under test
  Demux DEMUX(.select(sel), .in(in), .outA(a), .outB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: DEMUX");

    $write("Test 0: ");
    test(0, 0, 0, 0);

    $write("Test 1: ");
    test(1, 0, 0, 0);

    $write("Test 2: ");
    test(0, 1, 1, 0);

    $write("Test 3: ");
    test(1, 1, 0, 1);


    #100
    $display("Finished Test: DEMUX");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input t_sel, t_in, t_expectedA, t_expectedB);
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
