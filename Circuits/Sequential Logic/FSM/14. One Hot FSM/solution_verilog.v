module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    
    parameter S0 = 0;
    parameter S1 = 1;
    parameter S2 = 2;
    parameter S3 = 3;
    parameter S4 = 4;
    parameter S5 = 5;
    parameter S6 = 6;
    parameter S7 = 7;
    parameter S8 = 8;
    parameter S9 = 9;
    
    assign next_state [S0] = (( state [S0] && ~in ) || ( state [S1] && ~in ) || ( state [S2] && ~in ) || ( state [S3] && ~in ) || ( state [S4] && ~in ) || ( state [S7] && ~in ) || ( state [S8] && ~in ) || ( state [S9] && ~in ));
    assign next_state [S1] = (  state [S0] &&  in ) || ( state [S8] &&  in ) || ( state [S9] &&  in ) ;
    assign next_state [S2] = (  state [S1] &&  in ) ;
    assign next_state [S3] = (  state [S2] &&  in ) ;
    assign next_state [S4] = (  state [S3] &&  in ) ;
    assign next_state [S5] = (  state [S4] &&  in ) ;
    assign next_state [S6] = (  state [S5] &&  in ) ;
    assign next_state [S7] = (( state [S6] &&  in ) || ( state [S7] &&  in ))  ;
    assign next_state [S8] = (  state [S5] && ~in ) ;
    assign next_state [S9] = (  state [S6] && ~in ) ;
    
    assign out1 = (state [S8] || state[S9] );
    assign out2 = (state [S7] || state[S9] );

endmodule
