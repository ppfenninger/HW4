// Single-bit D Flip-Flop with enable
//   Positive edge triggered
module register
(
output reg  q,
input		d,
input		wrenable,
input		clk
);

    always @(posedge clk) begin
        if(wrenable) begin
            q <= d;
        end
    end

endmodule

module register32
(
output[31:0] q, 
input[31:0] d,
input wrenable,
input clk
);

	generate
		genvar i;
		for (i=0; i < 32; i=i+1)
		begin
			register regis (
				.q (q[i]),
				.d (d[i]),
				.wrenable (wrenable),
				.clk (clk)
			);
		end
	endgenerate
endmodule


module register32zero
(
output[31:0] q, 
input[31:0] d,
input wrenable,
input clk
);

	generate
		genvar i;
		for (i=0; i < 32; i=i+1)
		begin
			assign q[i]=1'b0;
		end
	endgenerate
endmodule