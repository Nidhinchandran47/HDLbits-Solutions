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
    
    parameter LEFT=0, RIGHT=1, FALL_L=2, DIG_L=3, FALL_R=4, DIG_R=5;
    
    reg[2:0] state, next;
    
    always @ (posedge clk or posedge areset) begin
        if(areset)
            state <= LEFT;
        else
            state <= next;
    end
    
    always @ * begin
        case(state)
            LEFT	: next = ( !ground ? FALL_L : ( dig ? DIG_L : ( bump_left ? RIGHT : LEFT ) ) );
            RIGHT	: next = ( !ground ? FALL_R : ( dig ? DIG_R : ( bump_right ? LEFT : RIGHT ) ));
            DIG_L	: next = ( !ground ? FALL_L : DIG_L );
            DIG_R 	: next = ( !ground ? FALL_R : DIG_R );
            FALL_L	: next = ( !ground ? FALL_L : LEFT );
            FALL_R	: next = ( !ground ? FALL_R : RIGHT);
        endcase
    end
    
    assign walk_left	=	(state == LEFT);
    assign walk_right	=	(state == RIGHT);
    assign aaah			=	(state == FALL_L) || (state == FALL_R);
    assign digging		= 	(state == DIG_R) || (state == DIG_L);
endmodule
