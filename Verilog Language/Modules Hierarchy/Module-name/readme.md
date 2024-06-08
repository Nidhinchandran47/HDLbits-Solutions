# Problem Statement

This problem is similar to [module](https://github.com/Nidhinchandran47/HDLbits-Solutions/tree/main/Verilog%20Language/Modules%20Hierarchy/Module). You are given a module named mod_a that has 2 outputs and 4 inputs, in some order. You must connect the 6 ports by name to your top-level module's ports:

| Port in mod_a | Port in top_module |
| --- | ---|
|output out1 | out1 |
|output out2 | out2 |
| input in1	| a|
|input in2 | b |
|input in3	| c|
|input in4 | d |

You are given the following module:

```verilog
module mod_a ( output out1, output out2, input in1, input in2, input in3, input in4);
```

![alt text](image.png)
