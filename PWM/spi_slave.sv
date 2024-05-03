module spi_slave(
	input wire clk,           // Reloj de FPGA
	input wire rst,           
	input wire MOSI,          // Master Out Slave In
	output reg MISO,          // Master In Slave Out
	input wire SCLK,           // Clock proveniente del Arduino
	input wire ss,            // Slave Select, activo bajo
	output reg [7:0] data_received, // Datos recibidos del maestro
	input wire [7:0] data_to_send   // Datos a enviar al maestro
);

	// Estado interno del esclavo SPI
	reg [2:0] bit_count;    // Contador de bits
	reg [7:0] shift_reg;    // Registro de desplazamiento para la transmisión/recepción

	always @(posedge SCLK or posedge rst) begin
		if (rst) begin
			bit_count <= 0;
			shift_reg <= 0;
		end else if (!ss) begin  // Operar sólo cuando SS está activo (bajo)
			if (bit_count < 8) begin
				 // Recepción: lee desde MOSI en cada flanco ascendente del reloj
				 shift_reg <= {shift_reg[6:0], MOSI};
				 // Transmisión: escribe en MISO en cada flanco ascendente
				 MISO <= data_to_send[7 - bit_count];
				 bit_count <= bit_count + 1;
			end
		end else if (ss) begin
			if (bit_count == 8) begin
				 // Una vez que se reciben 8 bits, actualiza los datos recibidos
				 data_received <= shift_reg;
			end
			bit_count <= 0;  // Resetea el contador de bits cuando SS está inactivo (alto)
		end
	end
	
endmodule
