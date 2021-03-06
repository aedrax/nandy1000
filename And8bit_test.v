// Testbench
// Test   |    a     |    b     |   out    |
// Test 1 | 00000000 | 00000000 | 00000000 |
// Test 2 | 00000000 | 11111111 | 00000000 |
// Test 3 | 11111111 | 11111111 | 11111111 |
// Test 4 | 10101010 | 01010101 | 00000000 |
// Test 5 | 11000011 | 11110000 | 11000000 |
// Test 6 | 00110100 | 01110110 | 00110100 |

`include "And8bit.v"

module And8bitTest;

  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] out;
  reg [7:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  And8bit AND8BIT(.out(out), .inA(a), .inB(b));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: AND8BIT");

    $write("Test 1: ");
    test(8'b00000000, 8'b00000000, 8'b00000000);

    $write("Test 2: ");
    test(8'b00000000, 8'b11111111, 8'b00000000);

    $write("Test 3: ");
    test(8'b11111111, 8'b11111111, 8'b11111111);

    $write("Test 4: ");
    test(8'b10101010, 8'b01010101, 8'b00000000);

    $write("Test 5: ");
    test(8'b11000011, 8'b11110000, 8'b11000000);

    $write("Test 6: ");
    test(8'b00110100, 8'b01110110, 8'b00110100);

    
    #100
    $display("Finished Test: AND8BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [7:0] t_a, t_b, t_expected);
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
