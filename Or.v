module Or(out, inA, inB);
    output wire out;
    input  wire inA;
    input  wire inB;

    wire notOutA;
    wire notOutB;

    Not  gate1(notOutA, inA);
    Not  gate2(notOutB, inB);
    nand gate3(out, notOutA, notOutB);
endmodule
