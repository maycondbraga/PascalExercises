program Exercicio12;

//DEFININDO A PILHA
type pilha = record
     vetor : array[1..100] of integer;
     topo : integer;
end;

//CRIA A PILHA
procedure INIT (var p : pilha);
begin
    p.topo := 0;
end;

//ADICIONA ELEMENTO NA PILHA
procedure PUSH(var p : pilha; n : integer);
begin
    p.topo := p.topo + 1;
    p.vetor[p.topo] := n;
end;

//RETIRA ELEMENTO DA PILHA
procedure POP(var p : pilha);
begin
    p.topo := p.topo - 1;
end;

// RETORNA TRUE SE A PILHA ESTIVER VAZIA, FALSE SE NÃO ESTIVER
function ISEMPTY(p : pilha): boolean;
begin
    if (p.topo = 0) then
        begin
            ISEMPTY := true;
        end
    else
        begin
            ISEMPTY := false;
        end;
end;

// RETORNA TRUE SE A PILHA ESTIVER CHEIA, FALSE SE NÃO ESTIVER
function ISFULL(p: pilha ; max : integer): boolean;
begin
    if (p.topo = max) then
        begin
            ISFULL := true;
        end
    else
        begin
            ISFULL := false;
        end;
end;

// PROCEDURE RETORNA O TOTAL DE NUMEROS PARES NA PILHA
procedure PrintTiposValoresPilha(p : pilha; nElementos : integer);
var positivo, negativo : integer;
var par, impar : integer;

begin
    if (ISEMPTY(p)) then
        begin
            writeln('PILHA VAZIA');
        end
    else
        begin
            positivo := 0;
            negativo := 0;
            par := 0;
            impar := 0;
            p.topo := 1;
            while (p.topo <= nElementos) do 
                begin
                    if (p.vetor[p.topo] >= 0) then //VERIFICA SE É POSITIVO
                        begin
                            positivo := positivo + 1;
                            
                            if (p.vetor[p.topo] mod 2 = 0) then // VERIFICA SE É PAR
                                begin
                                    par := par + 1;
                                end
                            else //SE O NUMERO FOR IMPAR ENTRA AQUI
                                begin
                                    impar := impar + 1;
                                end;
                        end
                    else //SE O NUMERO FOR NEGATIVO ENTRA AQUI
                        begin
                            negativo := negativo + 1;
                            
                            if (abs(p.vetor[p.topo]) mod 2 = 0) then // VERIFICA SE É PAR
                                begin
                                    par := par + 1;
                                end
                            else //SE O NUMERO FOR IMPAR ENTRA AQUI
                                begin
                                    impar := impar + 1;
                                end;
                        end;
                    p.topo := p.topo + 1;
                end;
            writeln('NUMEROS POSITIVOS: ', positivo);
            writeln(' ');
            writeln('NUMEROS NEGATIVOS: ', negativo);
            writeln('');
            writeln('NUMEROS PAR: ', par);
            writeln('');
            writeln('NUMEROS IMPAR: ', impar);
        end;
end;

var p : pilha;
var totalPilha : integer;

begin
    INIT(p);
    PUSH(p, 1);
    PUSH(p, -2);
    PUSH(p, 3);
    PUSH(p, 4);
    PUSH(p, 22);
    PUSH(p, 12);
    
    totalPilha := 6;
    PrintTiposValoresPilha(p, totalPilha);
end.