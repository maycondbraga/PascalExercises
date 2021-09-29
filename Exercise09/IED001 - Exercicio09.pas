program Exercicio9;

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

// PROCEDURE QUE PASSA VALORES DO VETOR PARA UMA PILHA
procedure VetorToPilha(vetor : array of integer; totalVetor : integer ; var p : pilha);
begin
    if (totalVetor <= 0) then
        begin
            writeln('VETOR VAZIO / VALOR INDEVIDO NO NUMERO DE ELEMENTOS');
        end;
    while (p.topo < totalVetor) do 
        begin
            p.vetor[p.topo] := vetor[p.topo];
            writeln('NUMERO ADICIONADO NA PILHA');
            writeln('INDEX DA PILHA : ', p.topo);
            writeln('VALOR ADICIONADO : ', p.vetor[p.topo]);
            p.topo := p.topo + 1;
        end;
end;

var p : pilha;
var vet : array[1..5] of integer;
var totalVet : integer;

begin
    vet[1] := 10;
    vet[2] := 20;
    vet[3] := 30;
    vet[4] := 40;
    vet[5] := 50;
    
    totalVet := 5;
    
    INIT(p);
    
    VetorToPilha(vet, totalVet, p);
end.