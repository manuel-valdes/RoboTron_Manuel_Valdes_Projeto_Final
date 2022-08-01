* Settings *
Documentation       Arquivo de testes para o endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
#Casos válidos
Cenario: POST usuario inicial
    [tags]      CRIARUSER
    POST Usuario Inicial

Cenario: GET todos os usuarios 200
    [tags]      GETUSER
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario: GET usuario por ID 200
    [tags]      GETUSERID
    Criar Dados Usuario Valido
    Criar Usuario e Armazenar ID
    GET Endpoint /usuarios/_id
    Validar Status Code "200"

Cenario: POST cadastrar usuario 201
    [tags]      POSTUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"
    # DELETE Endpoint /usuarios

Cenario: POST criar usuario de massa estatica 201
    [tags]      POSTSTATICUSER
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario: PUT editar usuario 200
    [tags]      PUTUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenario: DELETE deletar usuario 200
    [tags]      DELETEUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

#Casos inválidos
Cenario: POST email ja cadastrado 400
    [tags]      POSTEMAILREPETIDO
    Pegar Dados Usuario Estatico Invalido
    POST Endpoint /usuarios Email Repetido
    Validar Status Code "400"

Cenario: POST usuario sem nome 400
    [tags]
    POST Endpoint /usuarios Sem Nome
    

Cenario: GET usuario id invalido 400
    [tags]      GETUSERIDINVALIDO      
    GET Endpoint /usuarios/_id ID Invalido
    Validar Status Code "400"