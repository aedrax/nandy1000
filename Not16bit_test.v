// Test   |        in        |       out        |
// Test 0 | 0000000000000000 | 1111111111111111 |
// Test 1 | 1111111111111111 | 0000000000000000 |
// Test 2 | 1010101010101010 | 0101010101010101 |
// Test 3 | 0011110011000011 | 1100001100111100 |
// Test 4 | 0001001000110100 | 1110110111001011 |

`include "Not16bit.v"

module Not16bitTest;

  reg [15:0] in;
  wire [15:0] out;
  reg [15:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  Not16bit NOT16BIT(.out(out), .in(in));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;
    $display("Begin Test: NOT");

    $write("Test 0: ");
    test(16'b0000000000000000, 16'b1111111111111111);
    
    $write("Test 1: ");
    test(16'b1111111111111111, 16'b0000000000000000);

    $write("Test 2: ");
    test(16'b1010101010101010, 16'b0101010101010101);

    $write("Test 3: ");
    test(16'b0011110011000011, 16'b1100001100111100);

    $write("Test 4: ");
    test(16'b0001001000110100, 16'b1110110111001011);
    
    #100
    $display("Finished Test: NOT16BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test (input [15:0] t_in, t_expected);
    in = t_in;
    expected = t_expected;    
    #1 $write("Input:%0h, Output:%0h, Expected:%0h ", in, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
