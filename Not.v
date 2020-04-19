module Not(cOut, cIn);
    output wire cOut;
    input  wire cIn;

    nand gate1(cOut, cIn, cIn);
endmodule
