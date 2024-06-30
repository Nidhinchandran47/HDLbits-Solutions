# Problem Statement

A single-output digital system with four inputs (`a,b,c,d`) generates a logic-1 when 2, 7, or 15 appears on the inputs, and a logic-0 when 0, 1, 4, 5, 6, 9, 10, 13, or 14 appears. The input conditions for the numbers 3, 8, 11, and 12 never occur in this system. For example, 7 corresponds to a,b,c,d being set to 0,1,1,1, respectively.

Determine the output out_sop in minimum SOP form, and the output out_pos in minimum POS form.

<details>
    <summary><h3> Solution </h3>
</summary>

#### Truth Table

| a   | b   | c   | d   | out   |
| --- | --- | --- | --- | ----- |
| 0   | 0   | 0   | 0   | **0** |
| 0   | 0   | 0   | 1   | **0** |
| 0   | 0   | 1   | 0   | **1** |
| 0   | 0   | 1   | 1   | **X** |
| 0   | 1   | 0   | 0   | **0** |
| 0   | 1   | 0   | 1   | **0** |
| 0   | 1   | 1   | 0   | **0** |
| 0   | 1   | 1   | 1   | **1** |
| 1   | 0   | 0   | 0   | **X** |
| 1   | 0   | 0   | 1   | **0** |
| 1   | 0   | 1   | 0   | **0** |
| 1   | 0   | 1   | 1   | **X** |
| 1   | 1   | 0   | 0   | **X** |
| 1   | 1   | 0   | 1   | **0** |
| 1   | 1   | 1   | 0   | **0** |
| 1   | 1   | 1   | 1   | **1** |

**SOP**

OUT = $\Sigma _m (2, 7, 8) + d_m(3,8,12)$

$= \overline{a}\overline{b}c+cd$

**POS**

OUT = $\Pi _M (0, 1, 4, 5, 6, 9, 10, 13, 14) . D_m(3,8,12)$

$= c(\overline{a}+b)(\overline{b}+d)$

Find the verilog file [here](solution_verilog.v)

</details>