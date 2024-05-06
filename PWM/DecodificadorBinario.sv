module DecodificadorBinario(
									input logic [3:0] bin,
									output logic [6:0] seg
									);

		always @ (bin) begin
			case(bin)
            4'b0000: seg = 7'b1000000;  //	Representa 0
            4'b0001: seg = 7'b1111001;  //	Representa 1
            4'b0010: seg = 7'b0100100;  //	Representa 2
            4'b0011: seg = 7'b0110000;  //	Representa 3
            4'b0100: seg = 7'b0011001;  //	Representa 4
            4'b0101: seg = 7'b0010010;  //	Representa 5
            4'b0110: seg = 7'b0000010;  //	Representa 6
            4'b0111: seg = 7'b1111000;  //	Representa 7
            4'b1000: seg = 7'b0000000;  //	Representa 8
            4'b1001: seg = 7'b0010000;  //	Representa 9
				4'b1010: seg = 7'b0001000;  //	Representa A - 10
				4'b1011: seg = 7'b0000011;  //	Representa B - 11
				4'b1100: seg = 7'b1000110;  //	Representa C - 12
				4'b1101: seg = 7'b0100001;  //	Representa D - 13
				4'b1110: seg = 7'b0000110;  //	Representa E - 14
				4'b1111: seg = 7'b0001110;  //	Representa F - 15
            default: seg = 7'b1111111;  //  Representa otro valor
				
        endcase
		  
    end

endmodule
