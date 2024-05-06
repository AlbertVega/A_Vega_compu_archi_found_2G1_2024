module OR (
			input logic A, B,
			output logic RestOR
);

always_comb begin
	RestOR = A || B;
	
end

endmodule