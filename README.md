# TAADDA CPU 

Totally  
Awesome  
Architecture  
Dude!  
Dude,  
Architecture!  

TAADDA is a CPU architecture that I made for fun and learning purposes in the sandbox of [Turing Complete](https://turingcomplete.game), a circuit simulator.

Turing Complete is able to export to Verilog, it is very unoptimized, but still pretty cool.

Schematic rendered from the Verilog
![An image of the CPU](./taadda.svg)

## Notes

The architecture is 32-bit. The assembly is pretty straight-forward, it's fixed-size with four bytes of instruction. The CPU is loosely ARM based, and is classified as Harvard architecture. The CPU contains an ALU, conditional unit, program memory, RAM, stack, program counter, input, output, and registers.

Byte0, OPCO is the opcode byte  
Byte1, ARG1 is the first argument address byte  
Byte2, ARG2 is the second argument address byte  
Byte3, DEST is the destination address byte

### Addresses

0-3: General purpose registers.  
  4: Stack
  5: RAM Register  
  6: Program Counter  
  7: System Input and Output  
  8: RAM
  
### Addressing Modes

The CPU uses two methods modes to access data.
Register Direct: ARG1, ARG2, and DEST directly specify the address of a register within the CPU. This is how to access data stored in the registers.
Immediate: When in immediate mode ARG1 or ARG2 contain a value, rather than an address.

### Components

#### RAM

The RAM stores runtime data of the program. The address of the RAM that is being accessed/written to is held in Register 5. Data is saved to RAM when the DEST byte is 8. Data is loaded from RAM to ARG1 or ARG2 when ARG1 or ARG2 respectively is 8.

#### Stack

The stack can be used to store temporary values and function return addresses.

To pop a value from the stack, ARG1 or ARG2 must be 4 and OPCO bit 3 must be 0. The value is then sent to the ARG1 or ARG2 data bus.

To push a value to the stack, DEST must be 4 and OPCO bit 3 must be 1, then the output of the ALU is pushed to the stack.  

These criteria are overridden when dealing with functions.

## Opcodes for Instruction:

ALU:  
The ALU takes ARG1 and ARG2, then saves the value to the DEST address.  
| Opcode | Instruction | Details |
| ------ | ----------- | ------- |
| 0 | ADD | - |
| 1 | SUB | ARG1 - ARG2 |
| 2 | AND | Bitwise AND |
| 3 | OR  | Bitwise OR |
| 4 | NOT | Bitwise NOT, only takes ARG1 |
| 5 | XOR | Bitwise XOR |

Conditional Unit:  
The conditional unit is used when OPCO bit 5 is set to 1. To write binary for the cond unit, refer to the chart below and add 32 to each opcode.
When a condition is true, than the value of the PC is set to the immediate value of DEST.
| Opcode | Instruction | Details |
| ------ | ----------- | ------- |
| 0 | EQUALS | - |
| 1 | NOT EQUALS | - |
| 2 | LESS THAN | ARG1 < ARG2 |
| 3 | LESS THAN EQUALS | ARG1 <= ARG2 |
| 4 | GREATER THAN | ARG1 > ARG2 |
| 5 | GREATER THAN OR EQUALS | ARG1 >= ARG2 | 

Immediate Values:  
Bit 6 makes ARG1 immediate.  
Bit 7 makes ARG2 immediate.  
In other words, add 64 and/or 128 to the instruction for an immediate value.  

Functions:  
When bits 3, 5, 6, and 7 are 1, the CPU ignores ARG1 and ARG2, and performs function calls and returns.  
If bit 4 is 0: PC is set to the immediate value of DEST and the current value of the PC is pushed to stack  
If bit 4 is 1: The top value on the stack is popped, and PC is set to popped value + 4.  

Effectively:
| Opcode | Instruction | Details |
| ------ | ----------- | ------- |
| 232 | CALL | Jumps to program memory address of DEST value |
| 248 | RETURN | Returns to instruction after address where function is called |

## Creating the schematic

I first exported the CPU from the Turing Complete simulation to Verilog, and fixed some of the auto generated Verilog. Then I used `yosys` with `yosys generate_json.v` to create a JSON of the CPU. I used `netlistsvg` to create an SVG of the JSON. 
