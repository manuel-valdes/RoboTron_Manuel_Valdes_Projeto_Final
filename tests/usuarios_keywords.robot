* Settings *
Documentation               Keywords e variaveis para ações do endpoint de usuarios
Resource                    ./common.robot

* Variables *
${nome_de_usuario}          marcelo marco antonio
${email_de_usuario}         lebronjames@qa.com
${password_de_usuario}      1234

* Keywords *
GET Endpoint /usuarios
    ${response}             GET On Session      serverest            /usuarios
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${payload}              Create Dictionary   nome=nome muito aleatorio   email=emailrandom12@random.com      password=${password_de_usuario}       administrador=true
    ${response}             POST On Session     serverest                  /usuarios                            json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${payload}              Create Dictionary   nome=franklin frankers      email=rockybalboa@gmail.com          password=${password_de_usuario}       administrador=true
    ${response}             PUT On Session      serverest                  /usuarios/${id_usuario}              json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest                   /usuarios/${id_usuario}      
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}                ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain          ${response.json()["message"]}                   ${palavra}

Printar Conteudo Response
    Log to console          Response: ${response}

Criar Usuario Estatico Valido
    ${json}                 Importar JSON Estatico                          _json_usuario_ex.json
    ${payload}              Set Variable                                    ${json["user_valido"]}
    Set Global Variable     ${payload}
    POST Endpoint /usuarios

Validar Criar Usuario
    Should Be Equal         ${response.json()["message"]}                   Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Usuario e Armazenar ID
    POST Endpoint /usuarios
    Validar Criar Usuario
    ${id_usuario}           Set Variable            ${response.json()["_id"]}
    Log To Console          ID Usuario: ${id_usuario}
    Set Global Variable     ${id_usuario}