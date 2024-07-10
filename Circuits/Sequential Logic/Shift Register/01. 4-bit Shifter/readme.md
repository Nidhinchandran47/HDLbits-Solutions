# Problem Statement

Build a 4-bit shift register (right shift), with asynchronous reset, synchronous load, and enable.

- areset: Resets shift register to zero.
- load: Loads shift register with data[3:0] instead of shifting.
- ena: Shift right (q[3] becomes zero, q[0] is shifted out and disappears).
- q: The contents of the shift register.
  
If both the load and ena inputs are asserted (1), the load input has higher priority.

