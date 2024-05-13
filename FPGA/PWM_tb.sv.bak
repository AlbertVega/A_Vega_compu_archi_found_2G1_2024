module PWM_tb;

    // Señales de entrada
    logic clk = 0;
	 logic [3:0] RegALU;
    // Señal de salida
    wire led;

    // Instancia del módulo PWM
	 PWM pwm( 
			.clk(clk),
			.RegALU(RegALU),
			.led(led)
	 );

    // Generador de clock
    always #5 clk = ~clk;

    initial begin
			
		  #100;	
		  
		  RegALU = 1;
		  
        #100;
		  
		  RegALU = 2;
		  
		  #100;
		  
		  RegALU = 3;
		  
		  #100;
		  
		  RegALU = 4;
		  
		  #100; 
		  
		  RegALU = 5;
		  
		  #100;
		  
		  RegALU = 6;
		  
		  #100;
		  
		  RegALU = 7;
		  
		  #100;
		  
		  RegALU = 8;
		  
		  #100;
		  
		  RegALU = 9;
		  
		  #100;
		  
		  RegALU = 10;
		  
        $finish; // Finalizar la simulación después de 1000 unidades de tiempo
    end

endmodule
