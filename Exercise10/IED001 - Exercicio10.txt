program Exercicio10;

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
function TotalDePares(p : pilha; nElementos : integer): integer;
var contadorPar, modulo : integer;

begin
    contadorPar := 0;
    p.topo := 1;
    while (p.topo <= nElementos) do 
        begin
            modulo := p.vetor[p.topo] mod 2;
            if (modulo = 0) then
                begin
                    writeln('numero par : ',p.vetor[p.topo]);
                    contadorPar := contadorPar + 1;
                end;
            p.topo := p.topo + 1;
        end;
    TotalDePares := contadorPar;
end;

var p : pilha;
var totalVet, totalPares : integer;

begin
    INIT(p);
    PUSH(p, 1);
    PUSH(p, 2);
    PUSH(p, 3);
    PUSH(p, 4);
    PUSH(p, 22);
    PUSH(p, 12);
    
    totalVet := 6;
    
    totalPares := TotalDePares(p, totalVet);
    writeln('TOTAL DE NUMEROS PARES NA PILHA = ', totalPares);
end.