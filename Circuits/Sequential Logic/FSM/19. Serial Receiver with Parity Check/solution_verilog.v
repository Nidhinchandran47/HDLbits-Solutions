module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    parameter 	IDLE	= 0;
    parameter 	RECV	= 1;
    parameter 	DONE	= 2;
    parameter 	EROR	= 3;
    parameter	PRTY	= 4;
    
    reg [2:0]	state, next;
    reg [3:0]	count;
    reg [9:0] 	temp;
    reg 		odd;
    
    parity M1 (clk,~(state == RECV), in, odd);  // when state is not recive-- reset. 
    
    always @ (*) begin
        case (state)
            IDLE : next = (in) ? IDLE : RECV;
            RECV : begin
                    if(count> 8)
                        next = (in == ~odd) ? PRTY : EROR;
                	else
                    	next = RECV;
            	   end
            DONE : next = (in) ? IDLE : RECV;
            EROR : next = (in) ? IDLE : EROR;
            PRTY : next = (in) ? DONE : EROR;
        endcase
    end
    
    always @ (posedge clk) begin
        if (reset) begin 
            state <= IDLE;
            count <= 0;
            temp  <= 0;
        end
        else begin 
            state <= next;
            temp  <= {in,temp[9:1]};
            if(next == RECV)
                count <= count + 1;
            if(next == EROR || next == DONE)
                count <= 0;
        end
    end
    
    assign done 	= (state == DONE);
    assign out_byte = (state == DONE) ? temp[7:0] : 8'b0 ;

endmodule
