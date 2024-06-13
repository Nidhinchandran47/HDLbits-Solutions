module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    always @ (*)
        begin
            if (sel_b1 & sel_b2 == 1)
                out_always = b;
            else
                out_always = a;
        end
    
    assign out_assign = ( sel_b1 & sel_b2 & b ) + ( ~(sel_b1 & sel_b2) & a );           
                    

endmodule