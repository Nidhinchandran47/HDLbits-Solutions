module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter 	IDLE	= 0;
    parameter 	RECV	= 1;
    parameter 	DONE	= 2;
    parameter 	EROR	= 3;
    
    reg [1:0]	state, next;
    reg [3:0]	count;
    
    always @ (*) begin
        case (state)
            IDLE : next = (in) ? IDLE : RECV;
            RECV : begin
                	if(count> 8)
                    	next = (in) ? DONE : EROR;
                	else
                    	next = RECV;
            	   end
            DONE : next = (in) ? IDLE : RECV;
            EROR : next = (in) ? IDLE : EROR;
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset) begin 
            state <= IDLE;
            count <= 0;
        end
        else begin 
            state <= next;
            if(next == RECV)
                count <= count + 1;
            if(next == EROR || next == DONE)
                count <= 0;
        end
    end
    
    assign done = (state == DONE);

endmodule
