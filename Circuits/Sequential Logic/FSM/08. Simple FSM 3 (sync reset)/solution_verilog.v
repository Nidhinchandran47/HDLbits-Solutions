module top_module(
    input clk,
    input in,
    input reset,
    output out); //
	reg [1:0] next_state,state;
    
    parameter A=0;
    parameter B=1;
    parameter C=2;
    parameter D=3;
    
    // State transition logic
	always @ * begin
        case(state)
            A : next_state=in?B:A;
            B : next_state=in?B:C;
            C : next_state=in?D:A;
            D : next_state=in?B:C;
        endcase
    end
    // State flip-flops with synchronous reset
	always @ (posedge clk) begin
        if(reset)
            state <= A;
        else
            state <= next_state;
    end
    // Output logic
	assign out = state==D;
endmodule
