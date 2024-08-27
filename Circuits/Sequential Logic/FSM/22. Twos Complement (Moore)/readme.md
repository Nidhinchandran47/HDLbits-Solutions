# Serial Twos Complement (moore)

You are to design a one-input one-output serial 2's complementer Moore state machine. The input (x) is a series of bits (one per clock cycle) beginning with the least-significant bit of the number, and the output (Z) is the 2's complement of the input. The machine will accept input numbers of arbitrary length. The circuit requires an asynchronous reset. The conversion begins when Reset is released and stops when Reset is asserted.

For example:

![alt text](image-1.png)

## Solution

```mermaid
stateDiagram
    [*] --> S0/0
    S0/0 --> S0/0 : 0
    S0/0 --> S1/1 : 1
    S1/1 --> S1/1 : 0
    S1/1 --> S2/0 : 1
    S2/0 --> S1/1 : 0
    S2/0 --> S2/0 : 1
```