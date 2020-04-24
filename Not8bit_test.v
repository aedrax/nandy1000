// Test   |    in    |   out    |
// Test 0 | 00000000 | 11111111 |
// Test 1 | 11111111 | 00000000 |
// Test 2 | 10101010 | 01010101 |
// Test 3 | 00111100 | 11000011 |
// Test 4 | 00010010 | 11101101 |
`include "Not8bit.v"

module Not8bitTest;

  reg [7:0] in;
  wire [7:0] out;
  reg [7:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  Not8bit NOT8BIT(.out(out), .in(in));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;
    $display("Begin Test: NOT");

    $write("Test 0: ");
    test(8'b00000000, 8'b11111111);
    
    $write("Test 1: ");
    test(8'b11111111, 8'b00000000);

    $write("Test 2: ");
    test(8'b10101010, 8'b01010101);

    $write("Test 3: ");
    test(8'b00111100, 8'b11000011);

    $write("Test 4: ");
    test(8'b00010010, 8'b11101101);
    
    #100
    $display("Finished Test: NOT8BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test (input [7:0] t_in, t_expected);
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
