module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter [2:0] lowest = 3'b000;
    parameter [2:0] low_in = 3'b001;
    parameter [2:0] low_de = 3'b010;
    parameter [2:0] hig_in = 3'b011;
    parameter [2:0] hig_de = 3'b100;
    parameter [2:0] higher = 3'b101;
    
    reg [2:0] state, next_state;
    
    always @ (posedge clk) begin
        if(reset)
            state <= lowest;
        else
            state <= next_state;
    end
    
    always @ * begin
        case (state)
            lowest : next_state = s[1] ? low_in : lowest;
            low_in : next_state = s[2] ? hig_in : (s[1] ? low_in : lowest);
            hig_in : next_state = s[3] ? higher : (s[2] ? hig_in : low_de);
            higher : next_state = s[3] ? higher : hig_de;
            hig_de : next_state = s[3] ? higher : (s[2] ? hig_de : low_de);
            low_de : next_state = s[2] ? hig_in : (s[1] ? low_de : lowest);
        endcase
    end
    
    always @ * begin
        case(state)
            lowest : {fr3,fr2,fr1,dfr} = 4'b1111;
            low_in : {fr3,fr2,fr1,dfr} = 4'b0110;
            hig_in : {fr3,fr2,fr1,dfr} = 4'b0010;
            higher : {fr3,fr2,fr1,dfr} = 4'b0000;
            hig_de : {fr3,fr2,fr1,dfr} = 4'b0011;
            low_de : {fr3,fr2,fr1,dfr} = 4'b0111;
        endcase
    end
endmodule
