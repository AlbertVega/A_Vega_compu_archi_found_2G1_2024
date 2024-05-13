module counter #(parameter N = 3)(
    input logic clk,       // Clock de la FPGA
    input logic rst,       // Reset del contador
    input logic btn,       // boton para modificar el contador
    input int top,
    output reg [N-1:0] out // Contador de salida
);

reg btn_prev = 1; // Almacena el valor anterior del botón

always @(posedge clk or posedge rst) begin
    if (rst) begin
        out <= 0; // Reinicia el contador cuando se activa el reset
        btn_prev <= 1;
    end else begin
        // Detectar flanco de bajada del botón
        if (!btn && btn_prev && (out != top)) begin
            out <= out + 1; 
        end else if (out == top) begin
            out <= 0; // Reinicia el contador cuando alcanza el máximo
        end
        btn_prev <= btn; // Actualiza el valor anterior del botón
    end
end

 
endmodule
