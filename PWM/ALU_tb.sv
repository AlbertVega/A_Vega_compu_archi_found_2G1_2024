module ALU_tb;
	
	logic [3:0] in1 = 0;
	logic [3:0] in2 = 0;
	logic [3:0] mode = 0;
	logic neg;
	logic cero;
	logic carry;
	logic des;
	logic [7:0] num;
	logic [1:0] [6:0] out;
	
	ALU alu_test (.in1(in1),
					  .in2(in2),
					  .mode(mode),
					  .num(num),
					  .neg(neg),
					  .cero(cero),
					  .carry(carry),
					  .des(des),
					  .out(out));

	initial begin
		
		// Suma test
		#5;
		in1 = 4;
		in2 = 5;
		#10;
		in1 = 15;
		in2 = 15;
		#10;
		
		#5;
		mode = 1;
		// Resta test
		#5;
		in1 = 0;
		in2 = 10;
		#10;
		in1 = 15;
		in2 = 9;
		#10;
		
		#5;
		mode = 2;
		
		// AND test
		#5;
		in1 = 15;
		in2 = 0;
		#10;
		in1 = 12;
		in2 = 4;
		#10;
		
		#5;
		mode = 4;
		// Or  test
		#5;
		in1 = 10;
		in2 = 5;
		#10;
		in1 = 0;
		in2 = 0;
		#10;
		
		#5;
		mode = 5;
		
		// Regreso
		mode = 0;
		#5;
	
	end

	
endmodule