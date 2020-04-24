// Testbench
// Test   |        a         |        b         |       out        |
// Test 0 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 1 | 0000000000000000 | 1111111111111111 | 0000000000000000 |
// Test 2 | 1111111111111111 | 1111111111111111 | 1111111111111111 |
// Test 3 | 1010101010101010 | 0101010101010101 | 0000000000000000 |
// Test 4 | 0011110011000011 | 0000111111110000 | 0000110011000000 |
// Test 5 | 0001001000110100 | 1001100001110110 | 0001000000110100 |

`include "And16bit.v"

module And16bitTest;

  reg [15:0] a;
  reg [15:0] b;
  wire [15:0] out;
  reg [15:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  And16bit AND16BIT(.out(out), .inA(a), .inB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: AND16BIT");

    $write("Test 0: ");
    test(16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 1: ");
    test(16'b0000000000000000, 16'b1111111111111111, 16'b0000000000000000);

    $write("Test 2: ");
    test(16'b1111111111111111, 16'b1111111111111111, 16'b1111111111111111);

    $write("Test 3: ");
    test(16'b1010101010101010, 16'b0101010101010101, 16'b0000000000000000);

    $write("Test 4: ");
    test(16'b0011110011000011, 16'b0000111111110000, 16'b0000110011000000);

    $write("Test 5: ");
    test(16'b0001001000110100, 16'b1001100001110110, 16'b0001000000110100);

    
    #100
    $display("Finished Test: AND16BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [15:0] t_a, t_b, t_expected);
    a = t_a;
    b = t_b;
    expected = t_expected;
    #1 $write("A:%0h, B:%0h, Output:%0h, Expected:%0h ", a, b, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
