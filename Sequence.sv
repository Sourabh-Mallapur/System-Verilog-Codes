// Write HDL code for detecting sequence 010101 with overlap
module MooreFSM( input logic clk, reset, a, output logic y);
    typedef enum logic {s0, s1, s2, s3, s4, s5, s6} statetype;
    statetype state, nextstate;

    always_ff @( posedge clk, posedge reset )
        if (reset) state <= s0;
        else state <= nextstate;

    always_comb
        case(state)
            s0: if (a) nextstate = s0;
                else nextstate = s1;
            s1: if (a) nextstate = s2;
                else nextstate = s1;
                
            s2: if (a) nextstate = s0;
                else nextstate = s3;
            s3: if (a) nextstate = s4;
                else nextstate = s1;
            s4: if (a) nextstate = s0;
                else nextstate = s5;
            s5: if (a) nextstate = s6;
                else nextstate = s1;
            s6: if (a) nextstate = s0;
                else nextstate = s5;
            default: nextstate = s0;
        endcase
    

    assign y = (state == s6);
endmodule


module MealyFSM( input logic clk, reset, a, output logic y);
    typedef enum logic {s0, s1, s2, s3, s4, s5} statetype;
    statetype state, nextstate;

    always_ff @( posedge clk, posedge reset )
        if (reset) state <= s0;
        else state <= nextstate;

    always_comb
        case(state)
            s0: if (a) nextstate = s0;
                else nextstate = s1;
            s1: if (a) nextstate = s2;
                else nextstate = s1;
            s2: if (a) nextstate = s0;
                else nextstate = s3;
            s3: if (a) nextstate = s4;
                else nextstate = s1;
            s4: if (a) nextstate = s0;
                else nextstate = s5;
            s5: if (a) nextstate = s4;
                else nextstate = s1;
            default: nextstate = s0;
        endcase
    
    assign y = (state == s5 & a);
endmodule
