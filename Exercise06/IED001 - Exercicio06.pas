program Exercicio6;

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
    while (q^.proximo <> lista) do 
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
procedure AddNumeroListaCircular(var lista : endNODO; numero : integer);
var q, r, s : endNODO;
var deuCerto, modulo : integer;
begin
    if (lista = nil) then
        begin
            writeln('LISTA CIRCULAR VAZIA')
        end
    else
        begin
            deuCerto := 0;
            new(r);
            r^.dado := numero; 
            q := lista;
            while (q^.proximo <> lista) do 
                begin
                    modulo := q^.dado mod 2;
                    if (modulo = 0) then
                        begin
                            s := q^.proximo; //S aponta para o próximo nodo de Q
                            q^.proximo := r; //Q passa a apontar para R (novo numero)
                            r^.proximo := s; //R passa a apontar para S (fechando lista novamente)
                            deuCerto := 1; //Verificador ativado
                            break;
                        end;    
                    q := q^.proximo;
                end;
            if (deuCerto <> 1) then
                begin
                    
                    s := q^.proximo; //inicio lista
                    q^.proximo := r; //Q aponta para o novo numero
                    r^.proximo := s; //R(novo inicio) aponta para o próximo numero
                    lista := r;
                end;
        end;
end;

var p : endNODO;

//INICIANDO PROGRAMA
begin
    AddNumeroFIM(p, 1);
    AddNumeroFIM(p, 2); //Comentar quando verificar lista sem numero par
    AddNumeroFIM(p, 5);
    AddNumeroFIM(p, 7);
    CriaListaCircular(p);
    AddNumeroListaCircular(p, 4);
    PrintLista(p);
end.