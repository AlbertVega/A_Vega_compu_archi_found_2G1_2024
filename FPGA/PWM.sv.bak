module PWM( input logic clk,
				input logic [3:0] RegALU,
				input logic rst,
				input logic btn,
				output logic led
				
);

logic [7:0] Counter = 0;
int dutycycle;

//always_ff @(posedge clk) begin
//
//	dutycycle <= Counter;
//	
//	if (Counter < 10) 
//		Counter <= Counter + 1;
//		
//	else 
//		Counter <= 0; //Reset Counter
//end
/*
always_ff @(posedge clk) begin
        dutycycle <= out;
        Counter <= ((Counter + 1) & (Counter < 10)) | (0 & ~(Counter < 10)); // Simplificación del contador
end


//Se crea un 20% de ciclo de trabajo
//assign led = (Counter < dutycycle)? 1'b1 : 1'b0; //Se asigna el led a 1 cuando el valor del Counter es menor a 20
always_comb begin
        led = ((Counter < dutycycle) & 1'b1) | ((Counter >= dutycycle) & 1'b0); // Alternativa al operador ternario
end
*/

endmodule
