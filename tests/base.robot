* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot
Resource            ./carrinhos_keywords.robot


* Test Cases *
Cenario: GET todos os usuarios 200
    [tags]      GETUSER
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Printar Conteudo Response

Cenario: POST cadastrar usuario 201
    [tags]      POSTUSER
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT editar usuario 200
    [tags]      PUTUSER
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE deletar usuario 200
    [tags]      DELETEUSER
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST criar usuario de massa estatica 201
    [tags]      POSTSTATICUSER
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

Cenario: POST realizar login 200
    [tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: GET todos os produtos 200
    [tags]      GETPRODUTO
    Criar Sessao
    GET Endpoint /produtos
    Validar Status Code "200"
    Printar Conteudo Response

Cenario: POST criar produto 201
    [tags]      POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: PUT editar produto 200
    [tags]      PUTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    PUT Endpoint /produtos
    Validar Status Code "200"

Cenario: DELETE excluir produto 200
    [tags]      DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: GET carrinhos cadastrados 200
    [tags]      GETCARRINHO
    Criar Sessao
    GET Endpoint /carrinhos
    Validar Status Code "200"
    Printar Conteudo Response

* Keywords *
Criar Sessao
    Create Session          serverest           http://localhost:3000/