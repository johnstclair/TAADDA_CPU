module RegisterPlus (clk, rst, Load, Save_value, Save, Always_output, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [0:0] Load;
  input  wire [7:0] Save_value;
  input  wire [0:0] Save;
  output  wire [7:0] Always_output;
  output  wire [7:0] Output;

  TC_Register # (.UUID(64'd1 ^ UUID), .BIT_WIDTH(64'd8)) Register8_0 (.clk(clk), .rst(rst), .load(wire_2), .save(wire_4), .in(wire_0), .out(wire_3));
  TC_Constant # (.UUID(64'd2 ^ UUID), .BIT_WIDTH(64'd1), .value(1'd1)) On_1 (.out(wire_2));
  TC_Switch # (.UUID(64'd3587491547824661070 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_2 (.en(wire_1), .in(wire_3), .out(Output));

  wire [7:0] wire_0;
  assign wire_0 = Save_value;
  wire [0:0] wire_1;
  assign wire_1 = Load;
  wire [0:0] wire_2;
  wire [7:0] wire_3;
  assign Always_output = wire_3;
  wire [0:0] wire_4;
  assign wire_4 = Save;

endmodule
