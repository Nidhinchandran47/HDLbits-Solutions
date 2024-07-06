module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    function [7:0] bcd_increment(input [7:0] bcd, input [7:0] max);
        bcd_increment = (bcd == max) ? 8'h00 :
                        (bcd[3:0] == 4'h9) ? {bcd[7:4] + 4'h1, 4'h0} :
                        bcd + 8'h01;
    endfunction

    function [7:0] hour_increment(input [7:0] bcd);
        hour_increment = (bcd == 8'h12) ? 8'h01 :
                         (bcd[3:0] == 4'h9) ? {bcd[7:4] + 4'h1, 4'h0} :
                         bcd + 8'h01;
    endfunction

    always @(posedge clk) begin
        if (reset) begin
            pm <= 0;
            hh <= 8'h12;  // 12 AM
            mm <= 8'h00;
            ss <= 8'h00;
        end
        else if (ena) begin
            ss <= bcd_increment(ss, 8'h59);

            if (ss == 8'h59) begin
                mm <= bcd_increment(mm, 8'h59);
                
                if (mm == 8'h59) begin
                    hh <= hour_increment(hh);
                    
                    if (hh == 8'h11)
                        pm <= ~pm;
                end
            end
        end
    end

endmodule