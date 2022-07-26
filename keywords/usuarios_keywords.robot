* Settings *
Documentation               Keywords e variaveis para ações do endpoint de usuarios
Resource                    ../support/base.robot


* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest           /usuarios
    Set Global Variable     ${response}

GET Endpoint /usuarios/_id
    ${response}             GET On Session      serverest           /usuarios/${id_usuario}
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest           /usuarios                                    json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}           json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest           /usuarios/${response.json()["_id"]}      
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}        ${quantidade}

Pegar Dados Usuario Estatico Valido
    ${json}                 Importar JSON Estatico                  _json_usuario_ex.json
    ${payload}              Set Variable                            ${json["user_valido"]}
    Set Global Variable     ${payload}

Validar Criar Usuario
    Should Be Equal         ${response.json()["message"]}           Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Usuario e Armazenar ID
    POST Endpoint /usuarios
    Validar Criar Usuario
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Log To Console          ID Usuario: ${id_usuario}
    Set Global Variable     ${id_usuario}