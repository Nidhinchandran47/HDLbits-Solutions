# Problem Statement

A JK flip-flop has the below truth table. Implement a JK flip-flop with only a D-type flip-flop and gates. Note: Qold is the output of the D flip-flop before the positive clock edge.

| **J** | **K** | **Q**   |
| ----- | ----- | ------- |
| 0     | 0     | Q*old*  |
| 0     | 1     | 0       |
| 1     | 0     | 1       |
| 1     | 1     | ~Q*old* |


[Find the verilog Solution](solution_verilog.v)
