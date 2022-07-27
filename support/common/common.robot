* Settings *
Documentation       Keywords e variaveis para ações gerais
Library             OperatingSystem
Library             BuiltIn


* Keywords *
Validar Status Code "${statuscode}"
    Should Be True                  ${response.status_code} == ${statuscode}

Importar JSON Estatico
    [Arguments]     ${nome_arquivo}
    ${arquivo}      Get File        ${EXECDIR}/support/fixtures/static/${nome_arquivo}
    ${data}         Evaluate        json.loads('''${arquivo}''')        json
    [return]        ${data}

Validar Se Mensagem Contem "${palavra}"
    Should Contain          ${response.json()["message"]}               ${palavra}