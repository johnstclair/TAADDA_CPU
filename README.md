# TAADDA CPU 

Totally  
Awesome  
Architecture  
Dude!  
Dude,  
Architecture!  


TAADDA is a CPU architecture that I've been working on using the in game sandbox of [Turing Complete](https://turingcomplete.game)  

Turing Complete is able to export to Verilog, it is very unoptimized, but still pretty cool!  

The architecture is 32bit, and each byte of data is handled seperatly.  

Byte0 is the instruction byte  
Byte1 is the first argument address byte  
Byte2 is the second argument address byte  
Byte3 is the jump address  

## OPCODES for Instruction:
```
NOT COND:
0 = ADD
1 = SUB
2 = AND
3 = OR
4 = NOT (ONLY ARG1)
5 = XOR
6 = MULT

COND:


BIT6 makes ARG2 immediate (ARG2 will provide a number value, not an address)
BIT7 makes ARG1 immediate

```

The CPU has 6 registers
