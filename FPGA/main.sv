module main(
	input logic clk,
	input logic SCLK,
	input logic MOSI,
	input logic SS,
	output logic MISO,
	output logic N, Z, C, V,
	output logic led,
	output logic [6:0] display
);

reg [9:0] bits;
logic [3:0] Result;

logic [3:0] a;
logic [3:0] b;
logic [1:0] Sel;

assign a[0] = bits[6];
assign a[1] = bits[7];
assign a[2] = bits[8];
assign a[3] = bits[9];

assign b[0] = bits[2];
assign b[1] = bits[3];
assign b[2] = bits[4];
assign b[3] = bits[5];

assign Sel[0] = bits[0];
assign Sel[1] = bits[1];

SPI_slave SPI_slave_inst(
	.SCLK(SCLK),
	.MOSI(MOSI),
	.SS(SS),
	.MISO(MISO),
	.bits_out(bits)
);


ALU ALU_inst (
	.a(a),
	.b(b),
	.Sel(Sel),
	.Result(Result),
	.N(N), 
	.Z(Z), 
	.C(C),
	.V(V)
);

PWM PWM_inst(
	.clk(clk),
	.RegALU(Result),
	.led(led)
);

BCD_module BCD_module_inst(
	.A(Result[3]),
	.B(Result[2]),
	.C(Result[1]),
	.D(Result[0]),
	.display(display)
);

endmodule
