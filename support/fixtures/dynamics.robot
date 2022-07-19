* Settings *
Documentation       Keywords e variaveis para geração de massas de dados dinâmicas
Library             FakerLibrary


* Keywords *
Criar Dados Usuario Valido
    ${nome}                     FakerLibrary.Name
    ${email}                    FakerLibrary.Email
    ${payload}                  Create Dictionary       nome=${nome}        email=${email}      password=senha123           administrador=true
    Log To Console              ${payload}
    Set Global Variable         ${payload} 

Criar Dados Produto Valido
    ${nome}                     FakerLibrary.Name
    ${preco}                    FakerLibrary.RandomInt                      max=5000
    ${descricao}                FakerLibrary.Sentence
    ${quantidade}               FakerLibrary.RandomInt                      max=999
    ${produtos}                 Create Dictionary       nome=${nome}        preco=${preco}      descricao=${descricao}      quantidade=${quantidade}
    Log To Console              ${produtos}
    Set Global Variable         ${produtos}              