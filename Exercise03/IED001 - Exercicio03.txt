program Exercicio3;

//CRIANDO O NODO
type endNODO = ^NODO;
     NODO = record
            dado : integer;
            proximo: endNODO;
end;

//PROCEDURE QUE PRINTA OS VALORES DA LISTA
procedure PrintLista(var lista: endNODO);
var q : endNODO;
begin
    q := lista;
    while (q^.proximo <> nil) do 
        begin
            writeln(q^.dado);
            q := q^.proximo;
        end;
    writeln(q^.dado);
end;

//PROCEDURE QUE COLOCA NOVO NODO AO FIM DA LISTA
procedure AddNumeroFIM(var lista : endNODO; numero : integer);
var q, r : endNODO; 
begin
    new(r);
    r^.dado := numero;
    r^.proximo := nil;
    if (lista = nil) then
        begin
            lista := r;
        end
    else
        begin
            q := lista;
            while (q^.proximo <> nil) do
                begin
                    q := q^.proximo;
                end;
            q^.proximo := r;
        end;
end;

//PROCEDURE QUE VERIFICA TOTAL DE NODOS NA PARES NA LISTA
function TotalDePares(lista : endNODO): integer;
var total : integer;
var modulo : integer;
begin
    total := 0;
    if (lista = nil) then
        begin
            TotalDePares := total;    
        end
    else
        begin
            while (lista^.proximo <> nil) do 
                begin
                    modulo := lista^.dado mod 2;
                    if (modulo = 0) then
                        begin
                            total := total + 1;
                        end;    
                    lista := lista^.proximo;
                end;
            modulo := lista^.dado mod 2;
            if (modulo = 0) then
                begin
                    total := total + 1;
                end;
            TotalDePares := total;
        end;
end;

var p : endNODO;
var t: integer;
//INICIANDO PROGRAMA
begin
    AddNumeroFIM(p, 1);
    AddNumeroFIM(p, 2);
    AddNumeroFIM(p, 4);
    AddNumeroFIM(p, 5);
    AddNumeroFIM(p, 2);
    AddNumeroFIM(p, 4);
    AddNumeroFIM(p, 5);
    AddNumeroFIM(p, 2);
    t := TotalDePares(p);
    writeln('TOTAL DE NUMEROS PARES NA LISTA = ', t);
end.