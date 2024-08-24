module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
	
    reg [3:0] state, next;
    parameter 	S0 = 4'B0000,
    			S1 = 4'B0001,
    			S2 = 4'B0010,
    			S3 = 4'B0011,
    			S4 = 4'B0100,
    			S5 = 4'B0101,
    			S6 = 4'B0110,
    			DI = 4'B0111,
    			FL = 4'B1000,
    			ER = 4'B1001;
    			
    	
    always @ (posedge clk) begin
        if (reset)
            state <= S0;
        else
            state <= next;
    end
    
    always @(*) begin
        case (state)
            S0 : next = in ? S1 : S0;
            S1 : next = in ? S2 : S0;
            S2 : next = in ? S3 : S0;
            S3 : next = in ? S4 : S0;
            S4 : next = in ? S5 : S0;
            S5 : next = in ? S6 : DI;
            S6 : next = in ? ER : FL;
            DI : next = in ? S1 : S0;
            FL : next = in ? S1 : S0;
            ER : next = in ? ER : S0;
        endcase
    end
    
    assign disc = (state == DI);
    assign flag = (state == FL);
    assign err  = (state == ER);
    
endmodule
