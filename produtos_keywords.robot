* Settings *
Documentation           Keywords e variaveis para ações do endpoint de produtos

* Variables *
${token_auth}           Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjU3NjQzMTUyLCJleHAiOjE2NTc2NDM3NTJ9.K8zYu6CRw1oUWsOC40qybdH-ew8atZDKOozvAXircVc

* Keywords *
POST Endpoint /produtos
    &{header}               Create Dictionary       Authorization=${token_auth}
    &{payload}              Create Dictionary       nome=MouseTech      preco=400       descricao=Mouse     quantidade=100   
    ${response}             POST On Session         serverest           /produtos       data=&{payload}     headers=${header}
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}