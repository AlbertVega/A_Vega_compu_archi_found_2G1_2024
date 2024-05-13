module restador4bits(
	// parámetros de entrada
	input logic [3:0] A,
	input logic [3:0] B,
	input logic Cin,
	
	// parámetros de salida
	output logic [3:0]res,
	output logic Cout
	
	//output logic [3:0] Resultado,
	//output logic [6:0] salida7seg0,
	//output logic [6:0] salida7seg1

);

// conexiones intermedias para los carry, (Cin - Cout)
logic [4:0] Borrow;
assign Borrow[0] = Cin;

// instancias de restador de 1 bit y conectarlas en cadena
Restador_completo restador0(
	.A(A[0]),
	.B(B[0]),
	.Cin(Borrow[0]),
	.Resta(res[0]),
	.Cout(Borrow[1])
);

Restador_completo restador1(
	.A(A[1]),
	.B(B[1]),
	.Cin(Borrow[1]),
	.Resta(res[1]),
	.Cout(Borrow[2])
);

Restador_completo restador2(
	.A(A[2]),
	.B(B[2]),
	.Cin(Borrow[2]),
	.Resta(res[2]),
	.Cout(Borrow[3])
);

Restador_completo restador3(
	.A(A[3]),
	.B(B[3]),
	.Cin(Borrow[3]),
	.Resta(res[3]),
	.Cout(Borrow[4])
);

assign Cout = Borrow[4];


endmodule

