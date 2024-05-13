module ALU(
	input logic [3:0] a,
	input logic [3:0] b,
	input logic [1:0] Sel,

	output logic [3:0] Result,
	output logic N, Z, C, V
);
	
	logic [3:0] adder_result;
   logic adder_cout;
	
	logic [3:0] subtractor_result;
   logic subtractor_cout;
	
	logic [3:0] and_result;
	logic [3:0] or_result;
	

	//Instancia para el sumador
	
	sumador4bits sumador(
		.A(a),
		.B(b),
		.Cin(1'b0),
		.sum(adder_result),
		.Cout(adder_cout)
	);
	
	//Instancia para el restador
	
	restador4bits restador(
		.A(a),
		.B(b),
		.Cin(1'b0),
		.res(subtractor_result),
		.Cout(subtractor_cout)
	);
	
	assign and_result = a & b;
	
	assign or_result = a | b;

	
	// Instancia del multiplexor
   mux4to1 mux_bit0 (
       .S0(Sel[0]),      
		 .S1(Sel[1]),		 
       .D0(adder_result[0]), 
       .D1(subtractor_result[0]),
       .D2(and_result[0]),
       .D3(or_result[0]),
       .out(Result[0])                  
   );
	
	mux4to1 mux_bit1 (
       .S0(Sel[0]),      
		 .S1(Sel[1]),                       
       .D0(adder_result[1]), 
       .D1(subtractor_result[1]),
       .D2(and_result[1]),
       .D3(or_result[1]),
       .out(Result[1])                  
   );
	
	mux4to1 mux_bit2 (
       .S0(Sel[0]),      
		 .S1(Sel[1]),                       
       .D0(adder_result[2]), 
       .D1(subtractor_result[2]),
       .D2(and_result[2]),
       .D3(or_result[2]),
       .out(Result[2])                  
   );
	
	mux4to1 mux_bit3 (
       .S0(Sel[0]),      
		 .S1(Sel[1]),                       
       .D0(adder_result[3]), 
       .D1(subtractor_result[3]),
       .D2(and_result[3]),
       .D3(or_result[3]),
       .out(Result[3])                  
   );
	 
	// asignacion de flags

	assign C = ~Sel[1] & (adder_cout);
	assign N = Result[3];
	assign Z = ~Result[3] & ~Result[2] & ~Result[1] & ~Result[0];
	assign V = ((~Sel[0] ^ ~a[3]) ^ ~b[3]) & (a[3] ^ (adder_result[3] | subtractor_result[3])) & ~Sel[1] ;
	
endmodule
