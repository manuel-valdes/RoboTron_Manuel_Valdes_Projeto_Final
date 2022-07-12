* Settings *
Documentation           Keywords e variaveis para ações do endpoint de usuarios

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
    &{payload}              Create Dictionary   nome=marcos marcus   email=moncosmoncos@gmail.com     password=1234   administrador=true
    ${response}             POST On Session     serverest           /usuarios       data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    &{payload}              Create Dictionary   nome=jarbas djavan   email=reidairlanda@gmail.com     password=1234   administrador=true
    ${response}             PUT On Session      serverest       /usuarios/Rg2OsvZpq91zUzbu       data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session      serverest       /usuarios/Rg2OsvZpq91zUzbu      
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}