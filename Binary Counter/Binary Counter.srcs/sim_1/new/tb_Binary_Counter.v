`timescale 1ns / 1ps

module tb_binary_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the counter
    binary_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        reset = 1;

        #10;
        reset = 0;

        #170;
        reset = 1;

        #10;
        reset = 0;

        #30;
        $finish;
    end

endmodule