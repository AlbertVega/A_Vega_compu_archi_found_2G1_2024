module Sumador_completo (
			input logic A,
			input logic B,
			input logic Cin,
			
			output logic Cout,
			output logic  Suma
);

assign Suma = (A ^ B) ^ Cin;

assign Cout = (A & B) | ((A ^ B) & Cin);

endmodule
