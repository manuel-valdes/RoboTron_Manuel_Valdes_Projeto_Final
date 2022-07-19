* Settings *
Documentation       Arquivo de testes para o endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
Cenario: GET todos os usuarios 200
    [tags]      GETUSER
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST cadastrar usuario 201
    [tags]      POSTUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT editar usuario 200
    [tags]      PUTUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE deletar usuario 200
    [tags]      DELETEUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST criar usuario de massa estatica 201
    [tags]      POSTSTATICUSER
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"