* Settings *
Documentation               Keywords e variaveis para ações do endpoint de usuarios
Resource                    ../support/base.robot


* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest           /usuarios
    Set Global Variable     ${response}
    Log To Console          ${response.content}

GET Endpoint /usuarios/_id
    ${response}             GET On Session      serverest           /usuarios/${id_usuario}                     expected_status=anything
    Set Global Variable     ${response}
    Log To Console          ${response.content}

GET Endpoint /usuarios/_id ID Invalido
    ${response}             GET On Session      serverest           /usuarios/541                               expected_status=anything
    Set Global Variable     ${response}
    Log To Console          ${response.content}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest           /usuarios                                    json=${payload}
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Usuario Inicial
    &{payload}              Create Dictionary       nome=Marcos     email=fulano@qa.com       password=teste     administrador=true
    ${response}             POST On Session         serverest       /usuarios          data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios Email Repetido
    ${response}             POST On Session     serverest           /usuarios         json=${email_repetido}     expected_status=anything
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}           json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest           /usuarios/${id_usuario}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}        ${quantidade}

Pegar Dados Usuario Estatico Valido
    ${json}                 Importar JSON Estatico                  _json_usuario_ex.json
    ${payload}              Set Variable                            ${json["user_valido"]}
    Set Global Variable     ${payload}

Pegar Dados Usuario Estatico Invalido
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${email_repetido}       Set Variable                            ${json_invalido["user_invalido"]}
    Set Global Variable     ${email_repetido}  

Pegar Dados Usuario Estatico Sem Nome
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${user_sem_nome}        Set Variable                            ${json_invalido["user_sem_nome"]}
    Set Global Variable     ${user_sem_nome}   

Validar Criar Usuario
    Should Be Equal         ${response.json()["message"]}           Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Usuario e Armazenar ID
    POST Endpoint /usuarios
    Validar Criar Usuario
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Log To Console          ID Usuario: ${id_usuario}
    Set Global Variable     ${id_usuario}