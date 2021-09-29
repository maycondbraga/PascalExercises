program Exercicio4;

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
    while (q^.proximo <> lista) or (q^.proximo <> nil) do 
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

//CRIA LISTA CIRCULAR (ULTIMO NODO É LIGADO AO PRIMEIRO NODO)
procedure CriaListaCircular(var lista : endNODO);
var q : endNODO;
begin
    q := lista^.proximo;
    
    while (q^.proximo <> nil) do
        begin
            q := q^.proximo;
        end;
    q^.proximo := lista;
end;

//PROCEDURE ADICIONA NODOS NA LISTA CIRCULAR
function ListaCircularOuNao(lista : endNODO): boolean;
var q : endNODO;
begin
    if (lista = nil) then
        begin
            writeln('LISTA CIRCULAR VAZIA')
        end
    else
        begin
            q := lista;
            while true do
                begin
                    if (q^.proximo = lista) then //VERIFICA SE É CIRCULAR
                        begin
                            ListaCircularOuNao := true;
                            break;
                        end;
                    if (q^.proximo = nil) then //VERIFICA SE É NIL
                        begin
                            ListaCircularOuNao := false;
                            break;
                        end;
                    q := q^.proximo;
                end;
        end;
end;

var p : endNODO;
var circularOuNao : boolean;

//INICIANDO PROGRAMA
begin
    AddNumeroFIM(p, 1);
    AddNumeroFIM(p, 2);
    AddNumeroFIM(p, 5);
    AddNumeroFIM(p, 7);
    
    CriaListaCircular(p); //Comentar quando verificar lista não circular
    
    circularOuNao := ListaCircularOuNao(p);
    
    if (circularOuNao = true) then
        begin
            writeln('A LISTA É CIRCULAR');
        end
    else
        begin
            writeln('A LISTA NÃO É CIRCULAR');
        end;
end.