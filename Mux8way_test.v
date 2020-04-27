// Testbench
// Test   | sel | a | b | c | d | e | f | g | h | out |
// Test 0 | 000 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 |  0  |
// Test 1 | 001 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |  0  |
// Test 2 | 010 | 0 | 1 | 1 | 1 | 0 | 1 | 1 | 0 |  1  |
// Test 3 | 011 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 1 |  1  |
// Test 4 | 100 | 1 | 0 | 1 | 0 | 1 | 1 | 0 | 0 |  1  |
// Test 5 | 101 | 1 | 1 | 0 | 0 | 1 | 0 | 0 | 1 |  0  |
// Test 6 | 110 | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 1 |  0  |
// Test 7 | 111 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 1 |  1  |

`include "Mux8way.v"

module Mux8wayTest;

  reg [2:0] sel;
  reg a;
  reg b;
  reg c;
  reg d;
  reg e;
  reg f;
  reg g;
  reg h;
  wire out;
  reg expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux8way MUX8WAY(.out(out), .select(sel), .inA(a), .inB(b), .inC(c), .inD(d),
                                           .inE(e), .inF(f), .inG(g), .inH(h));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX8WAY");
  
    $write("Test 0: ");
    test(3'b000, 0, 0, 0, 0, 1, 0, 1, 0, 0);

    $write("Test 1: ");
    test(3'b001, 0, 0, 0, 0, 1, 1, 1, 1, 0);

    $write("Test 2: ");
    test(3'b010, 0, 1, 1, 1, 0, 1, 1, 0, 1);

    $write("Test 3: ");
    test(3'b011, 0, 1, 1, 1, 1, 0, 0, 1, 1);

    $write("Test 4: ");
    test(3'b100, 1, 0, 1, 0, 1, 1, 0, 0, 1);

    $write("Test 5: ");
    test(3'b101, 1, 1, 0, 0, 1, 0, 0, 1, 0);

    $write("Test 6: ");
    test(3'b110, 1, 1, 1, 1, 0, 1, 0, 1, 0);

    $write("Test 7: ");
    test(3'b111, 1, 1, 1, 0, 1, 0, 0, 1, 1);

    
    #100
    $display("Finished Test: MUX8WAY");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [2:0] t_sel, input t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_h, t_expected);
    sel = t_sel;
    a = t_a;
    b = t_b;
    c = t_c;
    d = t_d;
    e = t_e;
    f = t_f;
    g = t_g;
    h = t_h;
    expected = t_expected;
    #1 $write("Select:%0h, A:%0h, B:%0h, C:%0h, D:%0h, E:%0h, F:%0h, G:%0h, H:%0h, Output:%0h, Expected:%0h ",
             sel, a, b, c, d, e, f, g, h, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
