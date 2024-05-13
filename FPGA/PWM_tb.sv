module PWM_tb;

    // Señales de entrada
    logic clk = 0;
	 logic [3:0] RegALU;
    // Señal de salida
    logic led;

    // Instancia del módulo PWM
	 PWM pwm( 
			.clk(clk),
			.RegALU(RegALU),
			.led(led)
	 );
 
    // Generador de clock
    always #5 clk = ~clk;

    initial begin
			
		  #200;	
		  
		  RegALU = 1;
		  
        #200;
		  
		  RegALU = 2;
		  
		  #200;
		  
		  RegALU = 3;
		  
		  #200;
		  
		  RegALU = 4;
		  
		  #200; 
		  
		  RegALU = 5;
		  
		  #200;
		  
		  RegALU = 6;
		  
		  #200;
		  
		  RegALU = 7;
		  
		  #200;
		  
		  RegALU = 8;
		  
		  #200;
		  
		  RegALU = 9;
		  
		  #200;
		  
		  RegALU = 10;
		  
		  #200;
		  
		  RegALU = 11;
		  
		  #200;
		  
		  RegALU = 12;
		  
		  #200;
		  
		  RegALU = 13;
		  
		  #200;
		  
		  RegALU = 14;
		  
		  #200;
		  
		  RegALU = 15;
		  
		  #200;
		  
        $stop; // Finalizar la simulación después de 1000 unidades de tiempo
    end

endmodule
