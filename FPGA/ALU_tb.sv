module ALU_tb;
	
	
	logic [3:0] a = 0;
	logic [3:0] b = 0;
	logic [1:0] operator = 0;
	logic [3:0] Result;
	logic neg;
	logic cero;
	logic Carry;
	logic des;
	
	logic [1:0] out;
 
	ALU alu_test (
		.a(a),
		.b(b),
		.Sel(operator),
		.Result(Result),
		.N(neg),
		.Z(cero),
		.C(Carry),
		.V(des)
	);

	initial begin
		// Suma test
		operator = 0;
		#5;
		a = 4;
		b = 5;
		#10;
		a = 15;
		b = 15;
		#10;

		operator = 1;
		// Resta test
		#5;
		a = 0;
		b = 10;
		#10;
		a = 15;
		b = 9;
		#10;

		operator = 2;

		// AND test
		#5;
		a = 15;
		b = 0;
		#10;
		a = 12;
		b = 4;
		#10;

		operator = 3;
		// Or test
		#5;
		a = 10;
		b = 5;
		#10;
		a = 0;
		b = 0;
		#10;

	end

endmodule