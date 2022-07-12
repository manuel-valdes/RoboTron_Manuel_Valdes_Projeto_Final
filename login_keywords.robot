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