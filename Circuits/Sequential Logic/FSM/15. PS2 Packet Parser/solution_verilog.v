module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    parameter	BYT1	=	0;
    parameter 	BYT2	=	1;
    parameter	BYT3	=	2;
    parameter	DONE	=	3;
    
    reg [1:0] 	state,next;

    // State transition logic (combinational)
    always @ * begin
        case (state) 
            BYT1	: next = (in[3])? BYT2 : BYT1;
            BYT2	: next = BYT3;
            BYT3 	: next = DONE;
            DONE	: next = (in[3])? BYT2 : BYT1;
        endcase
    end

    // State flip-flops (sequential)
    always @ (posedge clk) begin
        if(reset)
            state <= BYT1;
        else
            state <= next;
    end
 
    // Output logic
    assign done = (state == DONE);

endmodule
