module Xor(cOut, cIna, cInb);
    output wire cOut;
    input  wire cIna;
    input  wire cInb;

    wire out1;
    wire out2;
    wire out3;

    nand gate1(out1, cIna, cInb);
    nand gate2(out2, cIna, out1);
    nand gate3(out3, cInb, out1);
    nand gate4(cOut, out2, out3);
endmodule
