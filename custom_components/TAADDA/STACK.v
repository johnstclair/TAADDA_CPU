module STACK (clk, rst, POP, PUSH, VALUE, OUTPUT);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [0:0] POP;
  input  wire [0:0] PUSH;
  input  wire [7:0] VALUE;
  output  wire [7:0] OUTPUT;

  TC_Switch # (.UUID(64'd7074329454283665801 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_0 (.en(wire_0), .in(wire_8[7:0]), .out(OUTPUT));
  TC_Ram # (.UUID(64'd2948243379973326899 ^ UUID), .WORD_WIDTH(64'd8), .WORD_COUNT(64'd256)) Ram_1 (.clk(clk), .rst(rst), .load(wire_0), .save(wire_1), .address({{24{1'b0}}, wire_3 }), .in0({{56{1'b0}}, wire_4 }), .in1(64'd0), .in2(64'd0), .in3(64'd0), .out0(wire_8), .out1(), .out2(), .out3());
  TC_Register # (.UUID(64'd2899198503889437525 ^ UUID), .BIT_WIDTH(64'd8)) Register8_2 (.clk(clk), .rst(rst), .load(wire_7), .save(wire_7), .in(wire_6), .out(wire_2));
  TC_Or # (.UUID(64'd4350758657910679118 ^ UUID), .BIT_WIDTH(64'd1)) Or_3 (.in0(wire_1), .in1(wire_0), .out(wire_7));
  TC_Mux # (.UUID(64'd811378315009019519 ^ UUID), .BIT_WIDTH(64'd8)) Mux8_4 (.sel(wire_0), .in0(wire_10), .in1(wire_9), .out(wire_5));
  TC_Add # (.UUID(64'd693033396702889721 ^ UUID), .BIT_WIDTH(64'd8)) Add8_5 (.in0(wire_5), .in1(wire_2), .ci(1'd0), .out(wire_6), .co());
  TC_Constant # (.UUID(64'd335789000279957694 ^ UUID), .BIT_WIDTH(64'd8), .value(8'hFF)) Constant8_6 (.out(wire_9));
  TC_Constant # (.UUID(64'd3299348888399212751 ^ UUID), .BIT_WIDTH(64'd8), .value(8'h1)) Constant8_7 (.out(wire_10));
  TC_Mux # (.UUID(64'd636369302048000513 ^ UUID), .BIT_WIDTH(64'd8)) Mux8_8 (.sel(wire_0), .in0(wire_2), .in1(wire_6), .out(wire_3));

  wire [0:0] wire_0;
  assign wire_0 = POP;
  wire [0:0] wire_1;
  assign wire_1 = PUSH;
  wire [7:0] wire_2;
  wire [7:0] wire_3;
  wire [7:0] wire_4;
  assign wire_4 = VALUE;
  wire [7:0] wire_5;
  wire [7:0] wire_6;
  wire [0:0] wire_7;
  wire [63:0] wire_8;
  wire [7:0] wire_9;
  wire [7:0] wire_10;

endmodule
