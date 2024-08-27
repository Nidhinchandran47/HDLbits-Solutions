    module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    reg state, next;
    
    always @ (posedge clk or posedge areset) begin
        if(areset)
            state <= 0;
        else
            state <= next;
    end
    
    always @ * begin
        case (state)
            0 : next = x ? 1'b1 : 1'b0;
            1 : next = 1;
        endcase
    end
    
    assign z = ((state == 1) && !x) || ((state == 0) && x);

endmodule
