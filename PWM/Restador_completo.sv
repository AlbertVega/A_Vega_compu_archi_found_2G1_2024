module Restador_completo (
			input logic A, B, Cin,
			output logic Cout, Resta
);

always_comb begin
	Cout = ((~A) & B) || (Cin & (~A)) || (Cin & B);
	Resta = (A ^ B) ^ Cin;
	
end

endmodule