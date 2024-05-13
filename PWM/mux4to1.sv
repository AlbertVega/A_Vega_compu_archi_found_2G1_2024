module mux4to1 (
	 input logic S0,               // Select lines 
	 input logic S1,
    input logic D0,
    input logic D1,
    input logic D2,
    input logic D3,
    output logic out  
);


assign out = (D0 & ~S1 & ~S0) | (D1 & ~S1 & S0) | (D2 & S1 & ~S0) | (D3 & S1 & S0);

endmodule
