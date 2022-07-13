* Settings *
Documentation           Keywords e variaveis para ações do endpoint de login

* Variables *
${email_para_login}         fulano@qa.com
${password_para_login}      teste

* Keywords *
POST Endpoint /login
    &{payload}              Create Dictionary       email=${email_para_login}       password=${password_para_login}   
    ${response}             POST On Session         serverest       /login          data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Login
    Should Be Equal         ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

Fazer Login e Armazenar Token
    POST Endpoint /login
    Validar Login
    ${token_auth}           Set Variable            ${response.json()["authorization"]}
    Log To Console          Token Salvo: ${token_auth}
    Set Global Variable     ${token_auth}   