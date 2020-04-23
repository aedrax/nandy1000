`ifndef _XOR
`define _XOR

module Xor(out, inA, inB);
    output wire out;
    input  wire inA;
    input  wire inB;

    wire nandOut1;
    wire nandOut2;
    wire nandOut3;

    nand gate1(nandOut1, inA, inB);
    nand gate2(nandOut2, inA, nandOut1);
    nand gate3(nandOut3, inB, nandOut1);
    nand gate4(out, nandOut2, nandOut3);
endmodule
`endif
