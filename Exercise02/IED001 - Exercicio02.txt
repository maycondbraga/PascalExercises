program Exercicio2;

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

//PROCEDURE QUE COLOCA NUMERO NA LISTA EM ORDEM CRESCENTE
procedure AddNumeroCrescente(var lista : endNODO; numero : integer);
var q, r, s : endNODO;
begin
    new(r);
    r^.dado := numero;
    r^.proximo := nil;
    if (lista = nil) then
        begin
            r^.proximo := nil;
            lista := r;
        end
    else
        begin
            q := lista;
            while (q^.proximo <> nil) do 
                begin
                    s := q^.proximo;
                    if (q^.dado < r^.dado) then
                        begin
                            if (s^.dado > r^.dado) then
                                begin
                                    r^.proximo := s;
                                    q^.proximo := r;
                                    break;
                                end;
                            q := q^.proximo;
                        end;
                end;
            q^.proximo := r;
        end;
end;

var p : endNODO;
//INICIANDO PROGRAMA
begin
    AddNumeroFIM(p, 1);
    AddNumeroFIM(p, 10);
    AddNumeroFIM(p, 20);
    AddNumeroFIM(p, 40);
    AddNumeroFIM(p, 60);
    writeln('LISTA ATUAL');
    PrintLista(p);
    writeln(' ');
    writeln('ACRESCENTANDO');
    AddNumeroCrescente(p, 35);
    writeln(' ');
    writeln('NOVA LISTA');
    PrintLista(p);
end.