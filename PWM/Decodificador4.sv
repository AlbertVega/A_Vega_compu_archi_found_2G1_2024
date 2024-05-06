module Decodificador4(
								input logic [1:0] [3:0]  num_all,
								output logic [1:0] [6:0] seg
);

	genvar i;
	logic [1:0] [6:0] temporal1;

	generate 

		for (i = 0; i < 4*2 - 1; i = i + 4) begin: for_loop
			DecodificadorBinario U1 (
				.bin(num_all[i/4]),
				.seg(temporal1[i/4])
			);
		end

	endgenerate
	assign seg = temporal1;

endmodule
