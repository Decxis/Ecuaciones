package analizador.lexico;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class App
{
    public static void main(String[] args) {
        try {
            // Crea una instancia del analizador léxico
            analizador.lexico.AnalizadorLexico lexer = new analizador.lexico.AnalizadorLexico
                    (new FileReader("C:\\Users\\kevin\\OneDrive\\Escritorio\\umg\\Copiladores\\Semana02\\analizador\\Analisi.txt"));

            // Itera sobre los tokens
            Token token;
            while ((token = lexer.yylex()) != null) {
                if (token.getTokenType() == TokenConstant.EOF) {
                    break; // Sal del bucle al llegar al final del archivo
                }
                System.out.println(token);
            }

        } catch (FileNotFoundException e) {
            System.err.println("Archivo no encontrado: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("Error de lectura del archivo: " + e.getMessage());
        }
    }
}
