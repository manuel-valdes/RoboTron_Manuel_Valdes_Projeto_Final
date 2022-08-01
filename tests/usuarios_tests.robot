* Settings *
Documentation       Arquivo de testes para o endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
#Casos válidos
Cenario 8: POST usuario inicial
    [tags]      CRIARUSER
    POST Usuario Inicial

Cenario 9: GET todos os usuarios 200
    [tags]      GETUSER
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario 10: GET usuario por ID 200
    [tags]      GETUSERID
    Criar Dados Usuario Valido
    Criar Usuario e Armazenar ID
    GET Endpoint /usuarios/_id
    Validar Status Code "200"

Cenario 11: POST cadastrar usuario 201
    [tags]      POSTUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"
    # DELETE Endpoint /usuarios

Cenario 12: POST criar usuario de massa estatica 201
    [tags]      POSTSTATICUSER
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario 13: PUT editar usuario 200
    [tags]      PUTUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"
    # DELETE Endpoint /usuarios

# Cenario: PUT editar senha do usuario 200
#     [tags]      PUTSENHA
#     Criar Dados Usuario Valido
#     POST Endpoint /usuarios
#     PUT Alterar Senha
#     Validar Status Code "200"

Cenario 14: DELETE deletar usuario 200
    [tags]      DELETEUSER
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

#Casos inválidos
Cenario 15: POST email ja cadastrado 400
    [tags]      POSTEMAILREPETIDO
    Pegar Dados Usuario Estatico Invalido
    POST Endpoint /usuarios Email Repetido
    Validar Status Code "400"

Cenario 16: POST usuario sem nome 400
    [tags]      POSTSEMNOME
    Pegar Dados Usuario Estatico Sem Nome
    POST Endpoint /usuarios Sem Nome
    Validar Status Code "400"

Cenario 17: POST usuario sem email 400
    [tags]      POSTSEMEMAIL
    Pegar Dados Usuario Estatico Sem Email
    POST Endpoint /usuarios Sem Email
    Validar Status Code "400"

Cenario 18: POST usuario sem senha 400
    [tags]      POSTSEMSENHA
    Pegar Dados Usuario Estatico Sem Senha
    POST Endpoint /usuarios Sem Senha
    Validar Status Code "400"

Cenario 19: POST usuario sem administrador 400
    [tags]      POSTSEMADM
    Pegar Dados Usuario Estatico Sem Administrador
    POST Endpoint /usuarios Sem Administrador
    Validar Status Code "400"

Cenario 20: GET usuario id invalido 400
    [tags]      GETUSERIDINVALIDO      
    GET Endpoint /usuarios/_id ID Invalido
    Validar Status Code "400"