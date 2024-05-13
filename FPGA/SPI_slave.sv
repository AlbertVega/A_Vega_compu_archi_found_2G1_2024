module SPI_slave(
	input logic SCLK,
	input logic MOSI,
	input logic SS,
	output logic MISO,
	output logic [9:0] bits_out
);
reg [15:0] bits = 0;

assign bits_out[0] = bits[6];  // bit 0 operador
assign bits_out[1] = bits[7];  // bit 1 operador
assign bits_out[2] = bits[8];  // bit 0 operando 2
assign bits_out[3] = bits[9];  // bit 1 operando 2
assign bits_out[4] = bits[10]; // bit 2 operando 2
assign bits_out[5] = bits[11]; // bit 3 operando 2
assign bits_out[6] = bits[12]; // bit 0 operando 1
assign bits_out[7] = bits[13]; // bit 2 operando 1
assign bits_out[8] = bits[14]; // bit 4 operando 1
assign bits_out[9] = bits[15]; // bit 3 operando 1

assign MISO = MOSI;

// leer los datos del Arduino (MOSI)
always @ (posedge SCLK & !SS) begin
	bits <= {bits[14:0], MOSI};	
end

endmodule
