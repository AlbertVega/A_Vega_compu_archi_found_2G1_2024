module comparator (
	input logic [3:0] a, b,
	output logic eq, lt, lte
);
	
assign eq = (a == b);
assign lt = (a < b);
assign lte = (a <= b);

endmodule
