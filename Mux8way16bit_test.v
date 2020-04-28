// Testbench
// Test   |  sel  |        a         |        b         |        c         |        d         |        e         |        f         |        g         |        h         |       out        |
// Test 00 |  000  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 01 |  001  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 02 |  010  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 03 |  011  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 04 |  100  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 05 |  101  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 06 |  110  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 07 |  111  | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 | 0000000000000000 |
// Test 08 |  000  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0001001000110100 |
// Test 09 |  001  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0010001101000101 |
// Test 10 |  010  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0011010001010110 |
// Test 11 |  011  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0100010101100111 |
// Test 12 |  100  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0101011001111000 |
// Test 13 |  101  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0110011110001001 |
// Test 14 |  110  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 0111100010011010 |
// Test 15 |  111  | 0001001000110100 | 0010001101000101 | 0011010001010110 | 0100010101100111 | 0101011001111000 | 0110011110001001 | 0111100010011010 | 1000100110101011 | 1000100110101011 |


`include "Mux8way16bit.v"

module Mux8way16bitTest;

  reg [2:0] sel;
  reg [15:0] a;
  reg [15:0] b;
  reg [15:0] c;
  reg [15:0] d;
  reg [15:0] e;
  reg [15:0] f;
  reg [15:0] g;
  reg [15:0] h;
  wire [15:0] out;
  reg [15:0] expected;
  reg allPassed;
  
  // Instantiate design under test
  Mux8way16bit MUX8WAY16BIT(.out(out), .select(sel),
                            .inA(a), .inB(b), .inC(c), .inD(d),
                            .inE(e), .inF(f), .inG(g), .inH(h));

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1);
    allPassed = 1;    
    $display("Begin Test: MUX8WAY16BIT");

    $write("Test 00: ");
    test(3'b000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 01: ");
    test(3'b001, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 02: ");
    test(3'b010, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 03: ");
    test(3'b011, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 04: ");
    test(3'b100, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 05: ");
    test(3'b101, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 06: ");
    test(3'b110, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 07: ");
    test(3'b111, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000,
         16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000);

    $write("Test 08: ");
    test(3'b000, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0001001000110100);

    $write("Test 09: ");
    test(3'b001, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0010001101000101);

    $write("Test 10: ");
    test(3'b010, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0011010001010110);

    $write("Test 11: ");
    test(3'b011, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0100010101100111);

    $write("Test 12: ");
    test(3'b100, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0101011001111000);

    $write("Test 13: ");
    test(3'b101, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0110011110001001);

    $write("Test 14: ");
    test(3'b110, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b0111100010011010);

    $write("Test 15: ");
    test(3'b111, 16'b0001001000110100, 16'b0010001101000101, 16'b0011010001010110, 16'b0100010101100111,
         16'b0101011001111000, 16'b0110011110001001, 16'b0111100010011010, 16'b1000100110101011, 16'b1000100110101011);

    
    #100
    $display("Finished Test: MUX8WAY16BIT");
    if (allPassed)
      $display("All tests PASSED");
    else
      $display("Some test has FAILED");
  end
  
  task test(input [2:0] t_sel, input [15:0] t_a, t_b, t_c, t_d, t_e, t_f, t_g, t_h, t_expected);
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