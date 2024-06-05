# Problem Statement

Build a combinational circuit with four inputs, in[3:0].

There are 3 outputs:

- out_and: output of a 4-input AND gate.
- out_or: output of a 4-input OR gate.
- out_xor: output of a 4-input XOR gate.
  
To review the AND, OR, and XOR operators, see [andgate](https://github.com/Nidhinchandran47/HDLbits-Solutions/tree/main/Verilog%20Language/Basics/And%20Gate), [norgate](https://github.com/Nidhinchandran47/HDLbits-Solutions/tree/main/Verilog%20Language/Basics/Nor%20gate), and [xnorgate](https://github.com/Nidhinchandran47/HDLbits-Solutions/tree/main/Verilog%20Language/Basics/Xnor%20gate)

given:

```verilog
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
```