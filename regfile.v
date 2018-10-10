//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "register.v"
`include "decoders.v"
`include "multiplexer.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);

wire[31:0] isSelWrite;
wire[31:0] regValues[31:0];

  decoder1to32 decoderWrite (
  	.out (isSelWrite),
  	.enable (RegWrite),
  	.address (WriteRegister)
  );

  assign regValues[0] = 32'b0;

  generate
		genvar i;
		for (i=1; i < 32; i=i+1)
		begin
			register32 regis (
				.q (regValues[i]),
				.d (WriteData),
				.wrenable (isSelWrite[i]),
				.clk (Clk)
			);
		end
  endgenerate

  mux32to1by32 muxRead1 (
  	.input0 (regValues[0]),
  	.input1 (regValues[1]),
  	.input2 (regValues[2]),
  	.input3 (regValues[3]),
  	.input4 (regValues[4]),
  	.input5 (regValues[5]),
  	.input6 (regValues[6]),
  	.input7 (regValues[7]),
  	.input8 (regValues[8]),
  	.input9 (regValues[9]),
  	.input10 (regValues[10]),
  	.input11 (regValues[11]),
  	.input12 (regValues[12]),
  	.input13 (regValues[13]),
  	.input14 (regValues[14]),
  	.input15 (regValues[15]),
  	.input16 (regValues[16]),
  	.input17 (regValues[17]),
  	.input18 (regValues[18]),
  	.input19 (regValues[19]),
  	.input20 (regValues[20]),
  	.input21 (regValues[21]),
  	.input22 (regValues[22]),
  	.input23 (regValues[23]),
  	.input24 (regValues[24]),
  	.input25 (regValues[25]),
  	.input26 (regValues[26]),
  	.input27 (regValues[27]),
  	.input28 (regValues[28]),
  	.input29 (regValues[29]),
  	.input30 (regValues[30]),
  	.input31 (regValues[31]),
  	.address (ReadRegister1),
  	.out (ReadData1)
  );


  mux32to1by32 muxRead2 (
  	.input0 (regValues[0]),
  	.input1 (regValues[1]),
  	.input2 (regValues[2]),
  	.input3 (regValues[3]),
  	.input4 (regValues[4]),
  	.input5 (regValues[5]),
  	.input6 (regValues[6]),
  	.input7 (regValues[7]),
  	.input8 (regValues[8]),
  	.input9 (regValues[9]),
  	.input10 (regValues[10]),
  	.input11 (regValues[11]),
  	.input12 (regValues[12]),
  	.input13 (regValues[13]),
  	.input14 (regValues[14]),
  	.input15 (regValues[15]),
  	.input16 (regValues[16]),
  	.input17 (regValues[17]),
  	.input18 (regValues[18]),
  	.input19 (regValues[19]),
  	.input20 (regValues[20]),
  	.input21 (regValues[21]),
  	.input22 (regValues[22]),
  	.input23 (regValues[23]),
  	.input24 (regValues[24]),
  	.input25 (regValues[25]),
  	.input26 (regValues[26]),
  	.input27 (regValues[27]),
  	.input28 (regValues[28]),
  	.input29 (regValues[29]),
  	.input30 (regValues[30]),
  	.input31 (regValues[31]),
  	.address (ReadRegister2),
  	.out (ReadData2)
  );

endmodule