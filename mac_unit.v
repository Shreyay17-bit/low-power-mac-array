
module mac_unit #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH  = 24
)(
    input  wire                     clk,
    input  wire                     reset,
    input  wire                     enable,

    input  wire [DATA_WIDTH-1:0]    a,
    input  wire [DATA_WIDTH-1:0]    b,

    output reg  [ACC_WIDTH-1:0]    acc
);

    wire gated_clk;

    // Clock gating
    assign gated_clk = clk & enable;

    // Multiply and accumulate
    always @(posedge gated_clk or posedge reset) begin
        if (reset)
            acc <= 0;
        else
            acc <= acc + (a * b);
    end

endmodule