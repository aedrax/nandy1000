module And(out, inA, inB);
    output wire out;
    input  wire inA;
    input  wire inB;

    wire nandOut;

    nand gate1(nandOut, inA, inB);
    Not  gate2(.out(out), .in(nandOut));
endmodule
