module Sumador_completo (
			input logic A, B, Cin,
			output logic Cout, Suma
);

always_comb begin
	Cout = (A & B)|| ((A ^ B)& Cin);
	Suma = (A ^ B) ^ Cin;
end

endmodule
