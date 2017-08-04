module Or(cIna, cInb, cOut);
    input  wire cIna;
    input  wire cInb;
    output wire cOut;

    wire out1;
    wire out2;

    Not  gate1(out1, cIna);
    Not  gate2(out2, cInb);
    nand gate3(cOut, out1, out2);
endmodule