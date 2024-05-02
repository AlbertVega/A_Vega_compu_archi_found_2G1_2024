module PWM( input logic clk,
				input logic [3:0] RegALU,
				input logic rst,
				input logic btn,
				output logic led
				
);

logic [3:0] out;

counter #(4) contador(
			.clk(clk),
			.rst(rst),
			.btn(btn),
			.top(11),
			.out(out)
);


logic [7:0] Counter = 0;
int dutycycle;

always_ff @(posedge clk) begin

	dutycycle <= out;
	
	if (Counter < 10) 
		Counter <= Counter + 1;
		
	else 
		Counter <= 0; //Reset Counter
end


//Se crea un 20% de ciclo de trabajo
assign led = (Counter < dutycycle)? 1'b1 : 1'b0; //Se asigna el led a 1 cuando el valor del Counter es menor a 20

endmodule
