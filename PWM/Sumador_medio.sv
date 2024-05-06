module Sumador_medio(
					input logic A, B,
					output logic Cout, Suma
);

always_comb begin
	Cout = A & B; 
	Suma = A ^ B;
end 

endmodule
