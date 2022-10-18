// Priority Encoder Using Casez

module priorityencoder( input logic [3:0] a, output logic [3:0] y);
always_comb 
    casez (a)
        4'b1??? : 4'b1000; 
        4'b01?? : 4'b0100; 
        4'b001? : 4'b0010; 
        4'b0001 : 4'b0001; 
        4'b0000 : 4'b0000; 
    endcase
endmodule


// Testbench
module priorityencoder_tb();
logic [3:0] a, y;
priorityencoder dut (a, y);
initial begin
    #10 a = 4'b0010;
    #10 a = 4'b0110;
    #10 a = 4'b0000;
    #10 a = 4'b1110;
    #10 a = 4'b0001;
    #10 $finish;
end
endmodule
