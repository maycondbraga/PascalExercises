program Exercicio1;
var contador : integer;
var vetor : array[1..1000] of integer;
var tamanhoVetor : integer;
var existeOuNao : boolean;
var numeroParaPesquisa : integer;

function NumeroNoVetor(vetor : array of integer; numero : integer): boolean;
    var esquerda : integer;
    var direita : integer;
    var meio : integer;
    var existe : integer;
    begin
        direita := 1000;
        esquerda := 1;
        existe := 0;
        while (esquerda <= direita) do
            begin
                meio := (esquerda + direita) div 2;
                if (numero = vetor[meio]) then
                    begin
                        writeln('achou o meio, index no vetor:');
                        writeln(meio);
                        writeln('numero :');
                        writeln(vetor[meio]);
                        existe := 1;
                        break;
                    end;
                if (vetor[meio] < numero) then
                    begin 
                        writeln('colocando a direita, index no vetor:');
                        writeln(meio);
                        writeln('numero :');
                        writeln(vetor[meio]);
                        direita := meio - 1;
                    end
                else
                    begin
                        writeln('colocando a esquerda, index no vetor:');
                        writeln(meio);
                        writeln('numero :');
                        writeln(vetor[meio]);
                        esquerda := meio + 1;
                    end;
            end;
        if (existe = 1) then
            begin
                NumeroNoVetor := true;
            end
        else
            begin
                NumeroNoVetor := false;
            end;
    end;

begin
    contador := 1;
    tamanhoVetor := 1000;
    writeln('CRIANDO VETOR PARA TESTE.. ');
    while (contador < 1001) do
        begin
            //if (contador = 123) then
            //    begin
            //        vetor[tamanhoVetor] := 124;
            //        contador := contador+2;
            //    end
            //else
            //    begin
            //        vetor[tamanhoVetor] := contador;    
            //        contador := contador+1;
            //    end;
            //tamanhoVetor := tamanhoVetor-1;
            vetor[tamanhoVetor] := contador;
            contador := contador+1;
            tamanhoVetor := tamanhoVetor-1;
        end;
    writeln('VETOR CRIADO');
    
    numeroParaPesquisa := 123;
    existeOuNao := NumeroNoVetor(vetor, numeroParaPesquisa);
    writeln(existeOuNao);
end.