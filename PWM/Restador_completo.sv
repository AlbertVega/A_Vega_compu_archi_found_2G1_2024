module Restador_completo (
			input logic A,
			input logic B,
			input logic Cin,
			
			output logic Cout,
			output logic Resta
);


// asignación de resta de salida
assign Resta = (A ^ B) ^ Cin;


// asignación del carry de salida
assign Cout = ((~A) & B) || (Cin & (~A)) || (Cin & B);



endmodule
