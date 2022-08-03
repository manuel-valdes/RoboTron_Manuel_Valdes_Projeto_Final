* Settings *
Documentation       Arquivo de testes para o endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
#Casos válidos
# Cenario 8: POST usuario inicial
#     [tags]      8
#     POST Usuario Inicial

Cenario 9: GET todos os usuarios 200
    [tags]      9
    GET Endpoint /usuarios
    Validar Status Code "200"

Cenario 10: GET usuario por ID 200
    [tags]      10
    Criar Dados Usuario Valido
    Criar Usuario e Armazenar ID
    GET Endpoint /usuarios/_id
    Validar Status Code "200"

Cenario 11: POST cadastrar usuario 201
    [tags]      11
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"
    # DELETE Endpoint /usuarios

Cenario 12: POST criar usuario de massa estatica 201
    [tags]      12
    Pegar Dados Usuario Estatico Valido
    POST Endpoint /usuarios
    Validar Status Code "201"

Cenario 13: PUT editar usuario 200
    [tags]      13
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Endpoint /usuarios
    Validar Status Code "200"
    # DELETE Endpoint /usuarios

Cenario 14: PUT editar senha do usuario 200
    [tags]      14
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Alterar Senha
    Validar Status Code "200"

Cenario 15: PUT editar senha com espacos 200
    [tags]      15
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Alterar Senha Invalida
    Validar Status Code "200"

Cenario 16: PUT editar nome do usuario 200
    [tags]      16
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Alterar Nome
    Validar Status Code "200"

Cenario 17: PUT editar email do usuario 200
    [tags]      17
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT Alterar Email
    Validar Status Code "200"

Cenario 18: DELETE deletar usuario 200
    [tags]      18
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario 19: DELETE usuario inexistente 200
    [tags]      19
    DELETE Endpoint /usuarios Invalido
    Validar Status Code "200"

#Casos inválidos
Cenario 20: GET usuario id invalido 400
    [tags]      20      
    GET Endpoint /usuarios/_id ID Invalido
    Validar Status Code "400"

Cenario 21: POST email ja cadastrado 400
    [tags]      21
    Pegar Dados Usuario Estatico Invalido
    POST Endpoint /usuarios Email Repetido
    Validar Status Code "400"

Cenario 22: POST usuario sem nome 400
    [tags]      22
    Pegar Dados Usuario Estatico Sem Nome
    POST Endpoint /usuarios Sem Nome
    Validar Status Code "400"

Cenario 23: POST usuario sem email 400
    [tags]      23
    Pegar Dados Usuario Estatico Sem Email
    POST Endpoint /usuarios Sem Email
    Validar Status Code "400"

Cenario 24: POST usuario sem senha 400
    [tags]      24
    Pegar Dados Usuario Estatico Sem Senha
    POST Endpoint /usuarios Sem Senha
    Validar Status Code "400"

Cenario 25: POST usuario sem administrador 400
    [tags]      25
    Pegar Dados Usuario Estatico Sem Administrador
    POST Endpoint /usuarios Sem Administrador
    Validar Status Code "400"

Cenario 26: PUT usuario ID invalido 400
    [tags]      26
    Criar Dados Usuario Valido
    POST Endpoint /usuarios
    PUT ID Invalido
    Validar Status Code "400"