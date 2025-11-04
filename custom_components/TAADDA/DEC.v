module DEC (clk, rst, Input, Output_1, Output_2);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Input;
  output  wire [7:0] Output_1;
  output  wire [7:0] Output_2;

  TC_Splitter8 # (.UUID(64'd72693007670783590 ^ UUID)) Splitter8_0 (.in(wire_2), .out0(), .out1(), .out2(), .out3(), .out4(), .out5(), .out6(wire_0), .out7(wire_1));

  wire [0:0] wire_0;
  assign Output_1 = {{7{1'b0}}, wire_0 };
  wire [0:0] wire_1;
  assign Output_2 = {{7{1'b0}}, wire_1 };
  wire [7:0] wire_2;
  assign wire_2 = Input;

endmodule
