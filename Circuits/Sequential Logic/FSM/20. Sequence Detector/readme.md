# Sequence Detector

Synchronous HDLC framing involves decoding a continuous bit stream of data to look for bit patterns that indicate the beginning and end of frames (packets). Seeing exactly 6 consecutive 1s (i.e., 01111110) is a "flag" that indicate frame boundaries. To avoid the data stream from accidentally containing "flags", the sender inserts a zero after every 5 consecutive 1s which the receiver must detect and discard. We also need to signal an error if there are 7 or more consecutive 1s.

Create a finite state machine to recognize these three sequences:

- 0111110: Signal a bit needs to be discarded (disc).
- 01111110: Flag the beginning/end of a frame (flag).
- 01111111...: Error (7 or more 1s) (err).

When the FSM is reset, it should be in a state that behaves as though the previous input were 0.

**Here are some example sequences that illustrate the desired operation.**

Discard 0111110:

![alt text](image.png)

Flag 01111110:

![alt text](image-1.png)

Reset behaviour and error 01111111...:

![alt text](image-2.png)


## Solution

[**Verilog code**](solution.v)

```mermaid
stateDiagram-v2
    [*] --> S0
    S0 --> S0 : in = 0
    S0 --> S1 : in = 1
    S1 --> S0 : in = 0
    S1 --> S2 : in = 1
    S2 --> S0 : in = 0
    S2 --> S3 : in = 1
    S3 --> S0 : in = 0
    S3 --> S4 : in = 1
    S4 --> S0 : in = 0
    S4 --> S5 : in = 1
    S5 --> DI : in = 0
    S5 --> S6 : in = 1
    S6 --> FL : in = 0
    S6 --> ER : in = 1
    DI --> S0 : in = 0
    DI --> S1 : in = 1
    FL --> S0 : in = 0
    FL --> S1 : in = 1
    ER --> S0 : in = 0
    ER --> ER : in = 1
```