// Testbench
// Test   |  sel  |   a   |   b   |   c   |   d   |  out  |
// Test 0 |   00  |  00101100  |  00101001  |  00000000  |  11111111  |  00101100  |
// Test 1 |   01  |  00010011  |  11011111  |  11010010  |  11101110  |  11011111  |
// Test 2 |   10  |  11101000  |  11111111  |  10000010  |  11010011  |  10000010  |
// Test 3 |   11  |  00000010  |  11010100  |  10000000  |  11111100  |  11111100  |
// Test 4 |   00  |  10001010  |  00110011  |  10010111  |  00010011  |  10001010  |
// Test 5 |   01  |  10010111  |  10010100  |  01111011  |  01110011  |  10010100  |
// Test 6 |   10  |  11110000  |  00001111  |  10101010  |  01010101  |  10101010  |
// Test 7 |   11  |  11000011  |  00111100  |  11001010  |  10100011  |  10100011  |

`include "Mux4way8bit.v"

module Mux4way8bitTest;

  reg [1:0] sel;
  reg [7:0] a;
  reg [7:0] b;
  reg [7:0] c;
  reg [7:0] d;
  wire [7:0] out;
  reg [7:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux4way8bit MUX4WAY8BIT(.out(out), .select(sel), .inA(a), .inB(b), .inC(c), .inD(d));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX4WAY8BIT");

    $write("Test 0: ");
    test(2'b00, 8'b00101100, 8'b00101001, 8'b00000000, 8'b11111111, 8'b00101100);

    $write("Test 1: ");
    test(2'b01, 8'b00010011, 8'b11011111, 8'b11010010, 8'b11101110, 8'b11011111);

    $write("Test 2: ");
    test(2'b10, 8'b11101000, 8'b11111111, 8'b10000010, 8'b11010011, 8'b10000010);

    $write("Test 3: ");
    test(2'b11, 8'b00000010, 8'b11010100, 8'b10000000, 8'b11111100, 8'b11111100);

    $write("Test 4: ");
    test(2'b00, 8'b10001010, 8'b00110011, 8'b10010111, 8'b00010011, 8'b10001010);

    $write("Test 5: ");
    test(2'b01, 8'b10010111, 8'b10010100, 8'b01111011, 8'b01110011, 8'b10010100);

    $write("Test 6: ");
    test(2'b10, 8'b11110000, 8'b00001111, 8'b10101010, 8'b01010101, 8'b10101010);

    $write("Test 7: ");
    test(2'b11, 8'b11000011, 8'b00111100, 8'b11001010, 8'b10100011, 8'b10100011);

    
    #100
    $display("Finished Test: MUX4WAY8BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [1:0] t_sel, input [7:0] t_a, t_b, t_c, t_d, t_expected);
    sel = t_sel;
    a = t_a;
    b = t_b;
    c = t_c;
    d = t_d;
    expected = t_expected;
    #1 $write("Select:%0h, A:%0h, B:%0h, C:%0h, D:%0h, Output:%0h, Expected:%0h ", sel, a, b, c, d, out, expected);
    if (out === expected)
      $display("[PASSED]");
    else begin
      $display("[FAILED]");
      allPassed <= 0;
    end
  endtask

endmodule
