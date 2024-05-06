module sumador4bits( 
		input logic [3:0]Ent1,
		input logic [3:0]Ent2,
		output logic Cout,
		output logic [3:0]Resultado,
		output logic [6:0]salida7seg0,
		output logic [6:0]salida7seg1
);

logic [4:0] temporal1;
logic [4:0] temporal2;

generate 
	Sumador_medio U1 (
		.A(Ent1[0]),
		.B(Ent2[0]),
		.Cout(temporal1[0]),
		.Suma(temporal2[0])
	);
	
	genvar i;

	for (i=1; i<4; i= i+1) begin: for_loop
		Sumador_completo U2 (
			.Cin(temporal1[i-1]),
			.A(Ent1[i]),
			.B(Ent2[i]),
			.Cout(temporal1[i]),
			.Suma(temporal2[i])
		);
	end

endgenerate
assign Resultado = temporal2;
assign Cout = temporal1[3];

endmodule