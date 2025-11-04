module TC_Register (
    input  wire clk,
    input  wire rst,
    input  wire load,
    input  wire save,
    input  wire [BIT_WIDTH-1:0] in,
    output reg  [BIT_WIDTH-1:0] out
);
    parameter UUID = 0;
    parameter NAME = "";
    parameter BIT_WIDTH = 1;

    reg [BIT_WIDTH-1:0] value;

    initial begin
        out   = {BIT_WIDTH{1'b0}};
        value = {BIT_WIDTH{1'b0}};
    end

    always @(posedge clk) begin
        if (rst)
            value <= {BIT_WIDTH{1'b0}};
        else if (save)
            value <= in;
    end

    always @(posedge clk) begin
        if (rst)
            out <= {BIT_WIDTH{1'b0}};
        else if (load)
            out <= value;
    end
endmodule
