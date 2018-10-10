// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 

endmodule
//This decoder works by setting the value of enable bitshifted by the number of places equal to the address to out
//If enable is 1, enable will be shifted over the number of placed dictated by address to cause the out[address] to be one
//If enable is zero, all bits will be zero (a bitshfted zero is always zero)

