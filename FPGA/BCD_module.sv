module BCD_module(input A, B, C, D, output [6:0] display);
	
    assign display[6] = ~A & ~B & ~C & D | ~A & B & ~C & ~D | A & ~B & C & D | A & B & ~C & D; 
    assign display[5] = B & C & ~D | A & C & D | A & B & ~D | ~A & B & ~C & D;
    assign display[4] = ~(B | ~C | D | A & C); 
    assign display[3] = ~B & ~C & D | B & C & D | ~A & B & ~C & ~D | A & ~B & C & ~D; 
    assign display[2] = ~A & D | ~B & ~C & D | ~A & B & ~C; 
    assign display[1] = ~A & ~B & D | ~A & ~B & C | ~A & C & D | A & B & ~C & D; 
    assign display[0] = ~A & ~B & ~C | ~A & B & C & D | A & B & ~C & ~D; 

endmodule
