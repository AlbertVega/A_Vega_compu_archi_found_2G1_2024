module sumador4bits( 
		input logic [3:0]A,
		input logic [3:0]B,
		input logic Cin,
		
		output logic [3:0] sum,
		output logic Cout
		//output logic [3:0]Resultado,
		//output logic [6:0]salida7seg0,
	  //output logic [6:0]salida7seg1
);

// conexiones intermedias para los carry, (Cin - Cout)
logic [4:0] Carry;

assign Carry[0] = Cin;

// instancias de sumador de 1 bit  y conectarlas en cadena

Sumador_completo Sumador0(
			.A(A[0]),
			.B(B[0]),
			.Cin(Carry[0]),
			.Suma(sum[0]),
			.Cout(Carry[1])
);

Sumador_completo Sumador1(
			.A(A[1]),
			.B(B[1]),
			.Cin(Carry[1]),
			.Suma(sum[1]),
			.Cout(Carry[2])
);

Sumador_completo Sumador2(
			.A(A[2]),
			.B(B[2]),
			.Cin(Carry[2]),
			.Suma(sum[2]),
			.Cout(Carry[3])
);

Sumador_completo Sumador3(
			.A(A[3]),
			.B(B[3]),
			.Cin(Carry[3]),
			.Suma(sum[3]),
			.Cout(Carry[4])
);
assign Cout = Carry[4];

endmodule
