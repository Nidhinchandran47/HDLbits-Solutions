module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter S0 = 0, 
    		  S1 = 1, 
              S2 = 2;
    reg[1:0] state,next;
    
    always@(*) begin
        case(state)
            S0 : next = (x)? S1 : S0;
            S1 : next = (x)? S2 : S1;
            S2 : next = (x)? S2 : S1;
        endcase
    end
    
    always@(posedge clk or posedge areset) begin
        if (areset) 
            state <= S0;
        else
            state <= next;
    end
    
    assign z = (state == S1);

endmodule
