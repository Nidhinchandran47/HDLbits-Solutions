module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    
    parameter LEFT   = 0,
    		  RIGHT  = 1,
    		  DIG_L  = 2,
    		  DIG_R  = 3,
    		  FALL_L = 4,
    		  FALL_R = 5,
    		  SPLAT  = 6;
    
    reg [2:0] state, next;
    reg [6:0] count;
    
    always @ (posedge clk or posedge areset) begin
        if (areset) begin
            state <= LEFT;
            count <= 0;
        end
        else if (state == FALL_L || state ==FALL_R ) begin
            state <= next;
            count <= count + 1;
        end
        else begin
            state <= next;
            count <= 0;
        end
    end
    
    always @ * begin
        case (state)
            LEFT  	: next = (!ground) ? FALL_L : ( dig ? DIG_L : ( bump_left  ? RIGHT : LEFT ));
            RIGHT 	: next = (!ground) ? FALL_R : ( dig ? DIG_R : ( bump_right ? LEFT : RIGHT ));
            DIG_L 	: next = (!ground) ? FALL_L : DIG_L;
            DIG_R 	: next = (!ground) ? FALL_R : DIG_R;
            FALL_L	: next = (!ground) ? FALL_L : ( ( count > 19 ) ? SPLAT : LEFT );
            FALL_R	: next = (!ground) ? FALL_R : ( ( count > 19 ) ? SPLAT : RIGHT);
			SPLAT 	: next = SPLAT ;
        endcase
    end
    
    assign walk_left	=	(state == LEFT);
    assign walk_right	=	(state == RIGHT);
    assign aaah			=	(state == FALL_L) || (state == FALL_R);
    assign digging		= 	(state == DIG_R) || (state == DIG_L);

endmodule
