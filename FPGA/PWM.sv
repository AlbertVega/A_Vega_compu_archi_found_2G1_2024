module PWM( input logic clk,
				input logic [3:0] RegALU,
				output logic led

);

logic [3:0] Counter = 0;

logic eq_flag;
logic lt_flag;
logic lte_flag;

comparator comparador(
	.a(15),
	.b(Counter),
	.eq(eq_flag),
	.lt(lt_flag),
	.lte(lte_flag)	
);


logic [3:0] dutycycle; 
 
always_ff @(posedge clk) begin

	dutycycle <= RegALU;
	
	Counter <= (eq_flag) ? 0 : (Counter + 1);

end


//Se crea un 20% de ciclo de trabajo
assign led = (Counter < dutycycle) ? 1'b1 : 1'b0; //Se asigna el led a 1 cuando el valor del Counter es menor a 20

endmodule
