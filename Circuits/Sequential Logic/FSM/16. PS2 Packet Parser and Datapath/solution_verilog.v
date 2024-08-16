module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //

    // FSM from fsm_ps2
    
    parameter	BYT1	=	0;
    parameter 	BYT2	=	1;
    parameter	BYT3	=	2;
    parameter	DONE	=	3;
    
    reg [1:0] 	state,next;
    reg [23:0]	out_b;

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
    
    // New: Datapath to store incoming bytes.
    always @ (posedge clk) begin
        if(reset)
            out_b <= 0;
        else
            out_b <= {out_b[15:0],in[7:0]};
    end
 
    // Output logic
    assign done = (state == DONE);
    assign out_bytes = (done) ? out_b : 0;
    

endmodule
