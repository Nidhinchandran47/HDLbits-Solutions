module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    reg [1:0] state, next;
    
    parameter S0 = 2'b00,
    		  S1 = 2'b01,
    		  S2 = 2'b10;
    
    always @ (posedge clk or negedge aresetn) begin
        if (!aresetn)
            state <= S0;
        else
            state <= next;
    end
    
    always @ * begin
        case (state)
            S0 : next = x ? S1 : S0;
            S1 : next = x ? S1 : S2;
            S2 : next = x ? S1 : S0;
        endcase
    end
    
    assign z = (state == S2) && x;
    
endmodule
