module Restador_medio (
			input logic A, B, 
			output logic Cout, Resta
);
always_comb begin
	Cout = ~A & B;
	Resta = A ^ B;
end

endmodule