module Not(out, in);
    output wire out;
    input  wire in;

    nand gate1(out, in, in);
endmodule
