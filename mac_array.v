module mac_array #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH  = 24
)(
    input wire                  clk,
    input wire                  reset,

    input wire [1:0]            mode,

    input wire [DATA_WIDTH-1:0] a0,
    input wire [DATA_WIDTH-1:0] b0,

    input wire [DATA_WIDTH-1:0] a1,
    input wire [DATA_WIDTH-1:0] b1,

    input wire [DATA_WIDTH-1:0] a2,
    input wire [DATA_WIDTH-1:0] b2,

    input wire [DATA_WIDTH-1:0] a3,
    input wire [DATA_WIDTH-1:0] b3,

    output wire [ACC_WIDTH-1:0] acc0,
    output wire [ACC_WIDTH-1:0] acc1,
    output wire [ACC_WIDTH-1:0] acc2,
    output wire [ACC_WIDTH-1:0] acc3
);

    // Enable signals
    wire enable0;
    wire enable1;
    wire enable2;
    wire enable3;

    // Configuration:
    // Mode 00 -> 1 MAC
    // Mode 01 -> 2 MACs
    // Mode 10 -> 3 MACs
    // Mode 11 -> 4 MACs

    assign enable0 = 1'b1;
    assign enable1 = (mode >= 2'b01);
    assign enable2 = (mode >= 2'b10);
    assign enable3 = (mode >= 2'b11);

    // MAC 0
    mac_unit MAC0 (
        .clk(clk),
        .reset(reset),
        .enable(enable0),
        .a(a0),
        .b(b0),
        .acc(acc0)
    );

    // MAC 1
    mac_unit MAC1 (
        .clk(clk),
        .reset(reset),
        .enable(enable1),
        .a(a1),
        .b(b1),
        .acc(acc1)
    );

    // MAC 2
    mac_unit MAC2 (
        .clk(clk),
        .reset(reset),
        .enable(enable2),
        .a(a2),
        .b(b2),
        .acc(acc2)
    );

    // MAC 3
    mac_unit MAC3 (
        .clk(clk),
        .reset(reset),
        .enable(enable3),
        .a(a3),
        .b(b3),
        .acc(acc3)
    );

endmodule