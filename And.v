module And(cOut, cIna, cInb);
    output wire cOut;
    input  wire cIna;
    input  wire cInb;

    wire out1;

    nand gate1(out1, cIna, cInb);
    Not  gate2(cOut, out1);
endmodule
