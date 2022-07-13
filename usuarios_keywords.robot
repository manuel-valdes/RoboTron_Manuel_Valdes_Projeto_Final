* Settings *
Documentation           Keywords e variaveis para ações do endpoint de usuarios
Resource                ./common.robot

* Variables *
${nome_de_usuario}      manuca_manuel
${email_de_usuario}     manuca_manuel@gmail.com
${password_de_usuario}  1234

* Keywords *
Criar Sessao
    Create Session          serverest           http://localhost:3000/

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest           /usuarios                       json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}              Create Dictionary   nome=jarbas djavan   email=reidairlanda@gmail.com     password=1234   administrador=true
    ${response}             PUT On Session      serverest           /usuarios/Rg2OsvZpq91zUzbu      json=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session      serverest        /usuarios/Rg2OsvZpq91zUzbu      
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}        ${quantidade}

Validar Se Mensagem Contem "${palavra}"
    Should Contain          ${response.json()["message"]}           ${palavra}

Printar Conteudo Response
    Log to console          Response: ${response}

Criar Usuario Estatico Valido
    ${json}                 Importar JSON Estatico      json_usuario_ex.json
    ${payload}              Set Variable                ${json["user_valido"]}
    Set Global Variable     ${payload}
    POST Endpoint /usuarios