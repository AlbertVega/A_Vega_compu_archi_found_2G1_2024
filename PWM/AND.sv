module AND (
			input logic A, B,
			output logic RestAND
);

always_comb begin
	RestAND = A & B;
	
end

endmodule