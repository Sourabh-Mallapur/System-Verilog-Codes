// Write HDL Code For D FlipFlop 
 
module Dflipflop (input logic [3:0]d,
            input logic clk,
            output logic [3:0] q, qbar);
    always @( posedge clk ) 
    begin
        q <= d;
        qbar <= ~q;
endmodule
 

// Testbench
module Dflipflop_tb();
logic clk;
logic [3:0]D, q, qbar;
Dflipflop dut(clk, D, q, qbar);
    initial begin
        clk = 0;
        forever 
        #5 clk = ~clk;
    end
    initial begin
        D = 0;
        #10 D = 1;
        #10 D = 0;
        #12 D = 1;
        #8 D = 0;
    end
endmodule