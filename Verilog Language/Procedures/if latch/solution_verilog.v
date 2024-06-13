module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
            shut_off_computer = 0;         // <-- need to specifiy all possible case
    end                                    //     otherwise latching condition occur
                                           //  ie, when an unspecified input occur, output will be last state itself (latch)
    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving = 0;              //  <- same here
    end

endmodule