program Exercicio5;

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

//PROCEDURE QUE VERIFICA TOTAL DE NODOS NA LISTA
procedure TotalDeParImpar(lista : endNODO);
var par, impar : integer;
var total : integer;
begin
    if (lista = nil) then
        begin
            writeln('LISTA VAZIA')
        end
    else
        begin
            par := 0;
            impar := 0;
            
            while (lista^.proximo <> nil) do 
                begin
                    if (lista^.dado mod 2 = 0) then //VERIFICA SE É PAR
                        begin
                            par := par + 1;
                        end
                    else    //ENTRA CASO SEJA IMPAR
                        begin
                            impar := impar + 1;
                        end;
                    lista := lista^.proximo;
                end;
            if (lista^.dado mod 2 = 0) then //VERIFICA SE É PAR
                begin
                    par := par + 1;
                end
            else    //ENTRA CASO SEJA IMPAR
                begin
                    impar := impar + 1;
                end;
            writeln('NUMEROS PAR: ', par);
            writeln('');
            writeln('NUMEROS IMPAR: ', impar);
        end;
end;

var p : endNODO;
//INICIANDO PROGRAMA
begin
    //4 NUMEROS PARES, 4 NUMEROS IMPARES
    AddNumeroFIM(p, 1);
    AddNumeroFIM(p, 2);
    AddNumeroFIM(p, 4);
    AddNumeroFIM(p, 6);
    AddNumeroFIM(p, 8);
    AddNumeroFIM(p, 9);
    AddNumeroFIM(p, 11);
    AddNumeroFIM(p, 13);
    TotalDeParImpar(p);
end.