<!-- ![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/compass.png) -->

# 👾 Introdução

<div align=justify>

O Robot Framework é uma tecnologia amplamente utilizada para o desenvolvimento e automação de cenários de teste. Sua integração com a linguagem de programação Python possibilita a criação e execução de inúmeros testes de maneira simples e eficiente. A estrutura do Robot é baseada no conceito de KDT - Keyword Driven Testing -, através do qual os profissionais de QA podem criar cenários complexos por meio de palavras-chave específicas. Além disso, existem diversas bibliotecas que podem ser importadas e utilizadas em conjunto com o framework, ampliando o horizonte de possibilidades para aqueles que desejam se aventurar no universo dos testes. 

Como parte do projeto final do Programa de Bolsas da Compass.uol, recebi o desafio de aumentar a cobertura de testes da API pública [ServeRest](https://serverest.dev/) no contexto do back-end (testes de integração). Para isso, acompanhei uma série de aulas e tutoriais guiados pela equipe de QA da Compass, nos quais desenvolvi conceitos de lógica, boas práticas, sintaxe Git, Python e Robot, além de uma noção geral de estrutura de software e de metodologias ágeis. 

Ao longo dos próximos parágrafos, descreverei como fazer a instalação de todas as ferramentas necessárias para a execução de testes estruturados em Robot na sua própria máquina. Ainda, explicarei como funciona o código de maneira geral e quais resultados podem se esperar ao interagir com o repositório remoto do qual este README faz parte. Vale ressaltar que este documento busca explicar de maneira detalhada cada passo do processo, com o objetivo de ser o mais acessível possível para aqueles que estão tendo seu primeiro contato com o universo do Quality Assurance. Para quem deseja navegar entre os tópicos, considere o índice abaixo para acessar diretamente seus principais pontos de interesse: 

- [Instalações](#instalacao)
    - [VSCode](#vscode)
    - [Git](#git)
    - [Python](#python)
    - [Node.js](#node)
    - [Robot Framework](#robot)
- [Baixando o repositório](#baixar-repositorio)
- [Interagindo com os arquivos no VSCode](#arquivos-vscode)
- [Entendendo o Robot](#entendendo-robot)
- [Suíte de casos de teste](#casos-teste)
- [Mapa mental da ServeRest](#mapa-mental)
- [Rodando os testes no cmd](#cmd)
- [Ferramentas, bibliotecas e extensões utilizadas](#ferramentas)
- [Referências](#referencias)
- [Agradecimentos](#agradecimentos)

# 💻 Instalações<a name="instalacao"></a>

Diversas ferramentas são necessárias para possibilitar a mágica por trás dos panos. Algumas delas simplesmente precisam estar instaladas no seu computador. Outras têm um papel ativo na forma com que interagimos com o código e executamos os cenários de teste. É importante ter em mente que seu computador vai fazer exatamente o que ele for instruído a fazer, portanto tente seguir os próximos passos com bastante atenção. Vai te poupar muito tempo (acredite em mim). 

Tentei estruturar o processo de instalação do mais básico para o mais "complexo". Todos eles são simples, mas alguns requerem que você simplesmente clique em um par de botões enquanto outros pedem um pouco mais de cuidado. Sem mais delongas, passamos ao primeiro.

## VSCode<a name="vscode"></a>

O [Visual Studio Code](https://code.visualstudio.com/) nada mais é que uma IDE (Integrated Development Environment), que por sua vez é uma palavra chique para "editor de textos". O VSCode facilita a visualização do código e integra diversas funcionalidade em um único ambiente. É através dele que seremos capazes de ler, editar e manipular nosso código. Sua instalação é extremamente simples. Acesse o [site oficial da plataforma](https://code.visualstudio.com/) e clique no botão "Download for Windows (Stable Build)". Siga os passos indicados no instalador, crie um atalho na Área de Trabalho (se achar necessário, eu particularmente acredito que facilita o acesso) e conclua o processo de instalação.

Em teoria, você já está pronto para explorar tudo que o VSCode tem a oferecer, porém antes de seguirmos para o próximo tópico, gostaria de aproveitar este espaço para indicar algumas extensões que facilitarão muito a sua vida. Você só vai entender a importância delas um pouco mais para a frente, mas para não ficar indo e voltando entre tópicos, prefiro centralizar tudo que se refere ao VSCode nesta seção. 

Para instalar extensões no VSCode, simplesmente clique em sua respectiva aba (aquela dos quadradinhos, no lado esquerdo superior da tela) e utilize a barra de pesquisas para encontrar as seguintes extensões:

1. Robot Framework Intellisense - extensão que suporta o Robot no VSCode

2. Tabnine AI Autocomplete - completa expressões e funções comuns da linguagem de programação que você está usando

3. Matherial Icon Theme - permite que apareça uma imagenzinha do lado do seu arquivo indicando de que tipo ele é (.py, .robot, .png, etc.)

Também recomendo que você procure algum tema que você goste na aba de extensões. No VSCode, os temas são paletas de cores que facilitam a visualização de diferentes componentes do código e da própria IDE. Claro, não é nada obrigatório (mas deixa tudo mais legal).

PS: O VSCode indicará que é necessário instalar a extensão do Python para o VSCode para que ele funcione corretamente. *NÃO* instale essa extensão. Ela acaba conflitando com a sua versão do Python e pode vir a gerar problemas de funcionamento do pip. Todos os nossos testes serão rodados no próprio cmd.

## Git<a name="git"></a>

O Git é a principal tecnologia de versionamento do mercado. Através dele, equipes de dezenas de pessoas podem trabalhar no mesmo projeto de desenvolvimento sem gerar conflitos destrutivos ou perder informações e funcionalidades cruciais do sistema. O GitHub, site em que estamos neste momento, é basicamente uma plataforma de hospedagem de código que permite que, por meio de comandos Git, repositórios locais (aqueles que estão no seu computador) sejam armazenados de maneira remota, ou seja, na internet. 
  
Para que isso seja possível, é necessário que o Git esteja instalado na sua máquina. Os primeiros passos são simples: 

1. Acesse o [site oficial do Git](https://git-scm.com/)
2. Clique em "Download for Windows"
3. Execute o arquivo 
4. Siga todos os passos indicados no instalador 
  
OBS: O instalador passa por um monte de páginas, mas as principais opções são padronizadas e já estão marcadas. Clique "Next" em tudo. 

Uma das <i>features</i> que virá como resultado do processo de instalação é o "Git Bash", uma espécie de terminal do Git através do qual executaremos nossas ações. Abra o Git Bash e digite os seguintes comandos (aperte Enter depois de escrever o primeiro, só depois escreva o segundo):

        git config --global user.name "Seu Nome"

        git config --global user.email "seuemail@email.com"

Esse é o jeito do Git de saber quem você é. Agora, se você fizer atualizações ou edições em algum projeto, seus commits (suas ações no repositório) serão identificados. Pronto, seu Git está praticamente configurado. Claro, a "graça" do negócio é poder interagir com repositórios remotos, ou seja, aqueles que estão na internet. Nesse caso, existem alguns passos a mais, mas eles também são bem simples: 

1. Crie ou abra a pasta em que você deseja armazenar seu repositório
2. Clique na área vazia da pasta com o botão direito
3. Selecione "Git Bash Here"
4. Execute o comando:

        git init

5. Em seguida, rode este comando para linkar o repositório local ao GitHub:

        git remote add origin [url do repositório]

Em relação ao Git, isso é basicamente tudo que você precisa saber. Um pouco mais para frente explicarei outro conceito/comando, o git clone. Ele permite que você, literalmente, clone um repositório remoto na sua máquina e interaja com ele localmente. Spoiler: é assim que você vai ter acesso aos arquivos deste repositório. 

## Python<a name="python"></a>

O Python é tão simples de instalar quanto o VSCode. Existe apenas um detalhe *muito* importante ao qual você deve prestar atenção. Para baixar o Python, entre no site [python.org](https://www.python.org/), vá para a aba de "Downloads" e baixe a última versão do Python (3.10.5) para Windows. Execute o instalador e siga todos os passos.
  
IMPORTANTE: tenha certeza de que a seguinte opção está marcada no momento da instalação:

<div align=center> 

![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/install_python.png)

</div>

Depois disso, clique em "Install Now" e siga todos os passos indicados no instalador. Depois de terminar, abra o Prompt de Comando (digite cmd na barra de pesquisas do Windows e aperte Enter) e execute o seguinte código:

        python --version

Se a instalação correu bem, o cmd vai imprimir sua versão do Python (3.10.5) no console. Caso isso não aconteça e aparecer algum erro do tipo "python não é um comando reconhecido pelo sistema", você provavelmente não selecionou a opção de adicionar o Python ao Path no processo de instalação (e olha que eu avisei!). Se for o caso, acompanhe os seguintes passos:

1. Aperte a tecla Windows + a tecla R. A seguinte janela deve aparecer: 

<div align=center> 

![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/windows_r.png)

</div>

2. No campo "Abrir" digite "%appdata%" (sem as aspas) e aperte Enter
3. Procure a pasta Python na janela que abriu e clique nela
4. Clique na pasta Python310 e, em seguida, em Scripts
5. Copie o caminho das pastas (clique na barra da figura a seguir e aperte CTRL + C):

<div align=center> 

![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/barra_scripts.png)

</div>

6. Com esse caminho copiado, pesquise "variáveis" na barra de pesquisa do Windows (canto inferior esquerdo)
7. Clique em "Editar as variáveis de ambiente do sistema"
8. Na nova janela, clique em "Avançado" e, em seguida, em "Variáveis de Ambiente..."
9. Dentro de "Variáveis de usuário", selecione "Path" e clique em editar
10. Neste novo menu, clique em "Novo" e adicione o caminho das pastas que você copiou (CTRL + V)

Pronto! Agora deve estar tudo certo. Novamente, rode o comando "python --version" no cmd. Se o erro persistir, verifique se você seguiu todos os passos corretamente e tente novamente.

## Node.js<a name="node"></a>

Lembra que um tempo atrás eu citei que algumas destas tecnologias simplesmente precisam estar na sua máquina e que, depois de instalá-las, não teríamos que nos preocupar muito com elas? Era exatamente ao Node.js que eu estava me referindo. Basicamente, o Node.js permite que códigos JavaScript rodem fora de um navegador web. Para nossos fins neste momento, isso é tudo que precisamos saber. Sua instalação também é extremamente simples. Acesse o [site oficial da ferramenta](https://nodejs.org/en/) e baixe a versão em que está escrito "Recommended for most users". Siga todos os passos indicados no instalador e pronto. 

## Robot<a name="robot"></a>

Chegamos na galinha dos ovos de ouro. Se você seguiu todos os passos até aqui corretamente, não devemos encontrar grandes dificuldades nesta etapa. Abra o cmd e digite o seguinte comando:

        pip install robot framework
                    
O "pip" nada mais é do que o gerenciador de pacotes do Python. Frameworks e bibliotecas podem ser instalados através dele. Depois desse comando, digite "robot --version" (também no cmd) e aperte Enter. Se aparecer a versão do Robot, deu tudo certo. Caso apareça um erro como "robot não é um comando reconhecido pelo sistema", novamente, a questão precisa ser resolvida através do Path. Siga os passos indicados na seção de instalação do Python (a pasta é a mesma, Scripts, dentro de Python310).

Também é recomendada a instalação da biblioteca Faker e da biblioteca RequestsLibrary através dos seguintes comandos:

        pip install robotframework-faker

        pip install robotframework-requests

# 👨🏻‍💻 Baixando o repositório<a name="baixar-repositorio"></a>

Agora que todas as ferramentas necessárias já estão presentes na sua máquina, podemos passar para a transferência do repositório para o seu sistema local. Lembra do "git clone"? O comando que eu falei que apresentaria um pouco mais para a frente. Pois bem, chegou sua hora. O "git clone" permite que você copie o repositório remoto completo para sua máquina com um único comando. Porém, antes de tudo, é necessário que você crie ou escolha uma pasta no seu computador na qual você deseja armazenar o conteúdo do repositório. Feito? 

Na pasta que você escolheu para armazenar o repositório, clique no espaço vazio com o botão direito e selecione "Git Bash Here". No Bash, digite o seguinte comando (para clonar este repositório, no caso de outros repositórios a URL, naturalmente, seria diferente):
  
        git clone https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final.git

Caso você ainda não tenha validado seu login no GitHub dentro desse repositório local, é possível que apareça uma janela pedindo que você autentique seu login. Se você estiver logado no GitHub dentro do seu browser, basta clicar em "Sign in with your browser". Outra forma de trazer um repositório remoto para sua máquina é de, literalmente, baixá-lo. Para isso, entre no link do repositório no GitHub que você deseja baixar, aperte o botão "Code" e selecione a opção "Download ZIP".

# 🔎 Interagindo com os arquivos no VSCode<a name="baixar-repositorio"></a>

Agora que todos os arquivos e pastas do repositório estão na sua máquina, vamos abri-los através do VSCode para que seja possível visualizar o código de maneira mais estruturada.

1. Abra o VSCode
2. No canto superior esquerdo, clique em "File" e em seguida selecione a opção "Open Folder"
3. Localize a pasta em que você clonou ou baixou o repositório
4. Clique em "Selecionar Pasta"
5. Agora, todos os arquivos foram importados para o seu VSCode dentro de suas respectivas pastas. Seu ambiente de exploração de arquivos (à esquerda) deve estar parecido com o da seguinte imagem:

<div align=center> 

![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/arquivos_vscode.png)

</div>

Clicando nas setinhas do lado esquerdo das pastas, é possível abri-las e enxergar todos os arquivos que aparecem dentro. A partir deste momento, você é capaz de abrir, executar e editar todos esses arquivos na sua máquina!

# 🤔 Entendendo o Robot<a name="entendendo-robot"></a>

O Robot Framework funciona por meio da criação e da execução de keywords. Existem diversas bibliotecas que oferecem keywords e parâmetros diversos para que você possa criar seus próprios casos de teste de maneira mais fácil e dinâmica. Ainda assim, um certo nível de programação e de lógica estrutural é necessário para que possamos criar casos de teste em que todos os passos envolvidos no cenário sejam abstraidos para o formato de keywords de maneira correta. Com isso em mente, recomendo que qualquer pessoa que esteja interessada em entender o Robot de forma mais completa leia um pouco da documentação das seguintes bibliotecas: [BuiltIn](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html), na qual as keywords nativas - as mais comuns - do Robot estão listadas e explicadas; e [OperatingSystem](https://robotframework.org/robotframework/latest/libraries/OperatingSystem.html), que permite que o Framework manipule e interaja com arquivos e diretórios da sua máquina. 

Existe um processo de importação associado com a utilização dessas bibliotecas. Na seção "* Settings *" do seu arquivo .robot, digite "Library", use a tabulação para separar o comando de sua especificação e escreva o nome da biblioteca que você deseja utilizar (isso funciona para qualquer biblioteca do Robot, porém em alguns casos pode ser que você precise instalá-la em sua máquina antes). A questão da tabulação é fundamental, uma vez que é a maneira do Robot de entender os comandos que você está passando para ele. 

Este repositório foi organizado de acordo com o padrão Service-Object, em que os arquivos que listam os casos de teste, os arquivos das keywords relacionadas a cada endpoint, os relatórios e etc. estão separados por pastas específicas. 

# 🎯 Suíte de casos de teste<a name="casos-teste"></a>

A seguir, disponibilizo uma tabela com todos os casos de teste criados, seus respectivos nomes, objetivos e resultados. Eles estão organizados de acordo com a ordem em que os endpoints aparecem na própria Serverest: login, usuários, produtos e carrinhos. 

</div>

<table>
  <tr>
    <td nowrap><strong>Cenário</strong></td>
    <td>Descrição</td>
    <td>Response</td>
    <td>Resultado</td>
  </tr>  
  <tr>
    <td>CT 01 - POST realizar login</td>
    <td>Caso de teste com objetivo de realizar login válido, com retorno de status code 200</td>
    <td>Response: "Login realizado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 02 - POST realizar login com usuário inexistente</td>
    <td>Caso de teste com objetivo de realizar login inválido, com retorno de status code 401</td>
    <td>Response: "Email e/ou senha inválidos"; status code: 401; PASS</td>
    <td>Bug documental: status code 401 não está previsto com essa mensagem</td>
  </tr>
  <tr>
    <td>CT 03 - POST login com senha inválida</td>
    <td>Caso de teste com objetivo de realizar login com senha inválida, com retorno de status code 401</td>
    <td>Response: "Email e/ou senha inválidos"; status code: 401; PASS</td>
    <td>Bug documental: status code 401 não está previsto com essa mensagem</td>
  </tr>
  <tr>
    <td>CT 04 - POST login sem senha</td>
    <td>Caso de teste com objetivo de realizar login sem senha, com retorno de status code 400</td>
    <td>Response: "Password não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 05 - POST login sem email</td>
    <td>Caso de teste com objetivo de realizar login sem email, com retorno de status code 400</td>
    <td>Response: "Email não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 06 - POST login com email inválido</td>
    <td>Caso de teste com objetivo de realizar login com email em formato inválido, com retorno de status code 400</td>
    <td>Response: "Email deve ser um email válido"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 07 - POST login sem email e sem senha</td>
    <td>Caso de teste com objetivo de realizar login sem email e sem senha, com retorno de status code 400</td>
    <td>Response: "Email não pode ficar em branco", "Password não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagens de response não estão na documentação</td>
  </tr>
  <tr>
    <td>CT 08 - POST usuário inicial</td>
    <td>Caso de teste com objetivo de criar o primeiro usuário ao rodar localmente, com retorno de status code 200</td>
    <td>Response: "Cadastro realizado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 09 - GET todos os usuários</td>
    <td>Caso de teste com objetivo de retornar todos os usuários registrados, com retorno de status code 200</td>
    <td>Response: lista de usuários (nome, email, password, administrador, id); status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
    <td>CT 10 - GET usuário por ID</td>
    <td>Caso de teste com objetivo de retornar um usuário específico, com retorno de status code 200</td>
    <td>Response: usuário com todos seus dados (nome, email, password, administrador, id); status code: 200; PASS</td>
    <td>Correu como esperado</td>
  <tr>
    <td>CT 11 - POST cadastrar usuário</td>
    <td>Caso de teste com objetivo de criar usuário válido, com retorno de status code 200</td>
    <td>Response: "Cadastro realizado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 12 - POST criar usuário de massa estática</td>
    <td>Caso de teste com objetivo de criar usuário válido através de um arquivo .json com dados estáticos, com retorno de status code 200</td>
    <td>Response: "Cadastro realizado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 13 - PUT editar usuário</td>
    <td>Caso de teste com objetivo de editar todos os dados de usuário válido registrado, com retorno de status code 200</td>
    <td>Response: "Registro alterado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 14 - PUT editar senha do usuário</td>
    <td>Caso de teste com objetivo de editar a senha de usuário válido, com retorno de status code 200</td>
    <td>Response: "Registro alterado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 15 - PUT editar senha com espaços</td>
    <td>Caso de teste com objetivo de editar a senha de usuário válido com espaços, com retorno de status code 200</td>
    <td>Response: "Registro alterado com sucesso"; status code: 200; PASS</td>
    <td>Bug: campo de senha permite espaços entre caracteres</td>
  </tr>
  <tr>
    <td>CT 16 - PUT editar nome do usuário</td>
    <td>Caso de teste com objetivo de editar o nome de usuário válido, com retorno de status code 200</td>
    <td>Response: "Registro alterado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 17 - PUT editar email do usuario</td>
    <td>Caso de teste com objetivo de editar o email de usuário válido, com retorno de status code 200</td>
    <td>Response: "Registro alterado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 18 - DELETE deletar usuario</td>
    <td>Caso de teste com objetivo de deletar usuário válido, com retorno de status code 200</td>
    <td>Response: "Registro excluído com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 19 - DELETE usuário inexistente</td>
    <td>Caso de teste com objetivo de deletar usuário inexistente, com retorno de status code 200</td>
    <td>Response: "Nenhum registro excluído"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 20 - GET usuário id inválido</td>
    <td>Caso de teste com objetivo de encontrar usuário através de ID inválido, com retorno de status code 400</td>
    <td>Response: "Usuário não encontrado"; status code: 400; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 21 - POST email já cadastrado</td>
    <td>Caso de teste com objetivo de criar usuário com email já cadastrado, com retorno de status code 400</td>
    <td>Response: "Este email já está sendo usado"; status code: 400; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 22 - POST usuário sem nome</td>
    <td>Caso de teste com objetivo de criar usuário sem nome, com retorno de status code 400</td>
    <td>Response: "Nome não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 23 - POST usuário sem email</td>
    <td>Caso de teste com objetivo de criar usuário sem email, com retorno de status code 400</td>
    <td>Response: "Email não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 24 - POST usuário sem senha</td>
    <td>Caso de teste com objetivo de criar usuário sem email, com retorno de status code 400</td>
    <td>Response: "Password não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 25 - POST usuário sem administrador</td>
    <td>Caso de teste com objetivo de criar usuário sem administrador, com retorno de status code 400</td>
    <td>Response: "Administrador deve ser 'true' ou 'false'"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 26 - PUT usuário ID inválido</td>
    <td>Caso de teste com objetivo de editar usuário com ID inválido, com retorno de status code 400</td>
    <td>Response: "Este email já está sendo usado"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response errada</td>
  </tr>
  <tr>
    <td>CT 27 - GET todos os produtos</td>
    <td>Caso de teste com objetivo de retornar todos os produtos, com retorno de status code 200</td>
    <td>Response: lista de todos os produtos (nome, preço, descrição, quantidade, id); status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 28 - GET produto por ID</td>
    <td>Caso de teste com objetivo de retornar um produto específico, com retorno de status code 200</td>
    <td>Response: todos os dados do produto (nome, preço, descrição, quantidade, id); status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 29 - POST criar produto</td>
    <td>Caso de teste com objetivo de criar um produto válido, com retorno de status code 200</td>
    <td>Response: "Cadastro realizado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 30 - PUT editar produto</td>
    <td>Caso de teste com objetivo de editar um produto válido, com retorno de status code 200</td>
    <td>Response: "Registro alterado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 31 - DELETE excluir produto</td>
    <td>Caso de teste com objetivo de excluir um produto válido, com retorno de status code 200</td>
    <td>Response: "Registro excluído com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 32 - GET produto por ID incorreto</td>
    <td>Caso de teste com objetivo de buscar um produto com ID incorreto, com retorno de status code 400</td>
    <td>Response: "Produto não encontrado"; status code: 400; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 33 - POST produto sem autorização</td>
    <td>Caso de teste com objetivo de criar um produto sem autorização, com retorno de status code 401</td>
    <td>Response: "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"; status code: 401; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 34 - POST produto sem nome</td>
    <td>Caso de teste com objetivo de criar um produto sem nome, com retorno de status code 400</td>
    <td>Response: "Nome não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 35 - POST produto sem preço</td>
    <td>Caso de teste com objetivo de criar um produto sem preço, com retorno de status code 400</td>
    <td>Response: "Preço deve ser um número"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 36 - POST produto sem descrição</td>
    <td>Caso de teste com objetivo de criar um produto sem preço, com retorno de status code 400</td>
    <td>Response: "Descrição não pode ficar em branco"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 37 - POST produto sem quantidade</td>
    <td>Caso de teste com objetivo de criar um produto sem preço, com retorno de status code 400</td>
    <td>Response: "Quantidade deve ser um número"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
  <tr>
    <td>CT 38 - POST produto com quantidade inválida</td>
    <td>Caso de teste com objetivo de criar um produto com quantidade além do limite, com retorno de status code 400</td>
    <td>Response: "quantidade": \"quantidade\" must be a safe number - Erro number.unsafe - Abra uma issue informando essa resposta. https://github.com/ServeRest/ServeRest/issues"; status code: 400; PASS</td>
    <td>Bug: limite não especificado</td>
  </tr>
  <tr>
    <td>CT 39 - Listar IDs produtos</td>
    <td>Caso de teste com objetivo de resetar a massa de produtos, com retorno de status code 200</td>
    <td>Status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 40 - GET carrinhos cadastrados 200</td>
    <td>Caso de teste com objetivo de retornar todos os carrinhos cadastrados, com retorno de status code 200</td>
    <td>Response: lista de carrinhos; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 41 - GET carrinho por ID</td>
    <td>Caso de teste com objetivo de retornar um carrinho específico, com retorno de status code 200</td>
    <td>Response: todos os dados do carrinho; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 42 - POST carrinho</td>
    <td>Caso de teste com objetivo de criar um carrinho válido, com retorno de status code 200</td>
    <td>Response: "Cadastro realizado com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 43 - DELETE carrinho cancelar compra</td>
    <td>Caso de teste com objetivo de deletar um carrinho através do cancelamento da compra, com retorno de status code 200</td>
    <td>Response: "Registro excluído com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 44 - DELETE carrinho concluir compra</td>
    <td>Caso de teste com objetivo de deletar um carrinho através da conclusão da compra, com retorno de status code 200</td>
    <td>Response: "Registro excluído com sucesso"; status code: 200; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 45 - GET carrinho inexistente</td>
    <td>Caso de teste com objetivo de buscar um carrinho com ID inválido, com retorno de status code 400</td>
    <td>Response: "Carrinho não encontrado"; status code: 400; PASS</td>
    <td>Correu como esperado</td>
  </tr>
  <tr>
    <td>CT 46 - POST carrinho sem produtos</td>
    <td>Caso de teste com objetivo de criar um carrinho sem produtos, com retorno de status code 400</td>
    <td>Response: "Produtos não contém 1 valor obrigatório"; status code: 400; PASS</td>
    <td>Bug documental: mensagem de response não está na documentação</td>
  </tr>
</table>

<div align=justify>

# 🕵️ Rodando os testes no cmd<a name="cmd"></a>

Para começar a rodar os testes, é importante entender uma coisa. Para que possamos ter mais controle sobre os dados que estamos enviando e recebendo, é mais interessante interagir com a ServeRest de forma local. Assim, estaremos manipulando apenas as massas de dados que nós mesmos criamos. Para que isso aconteça, abra o cmd e digite:

        npx serverest

Em poucos segundos a ferramenta iniciará de maneira local e abrirá uma aba com o endereço "localhost:3000" no seu navegador padrão. *IMPORTANTE*: mantenha o cmd em que este comando foi executado aberto, é ele que mantém o sistema rodando de maneira local. Para executar todos os próximos passos, abra um outro cmd.

Antes de passar para a execução em si dos arquivos, precisamos entender um pouco sobre como podemos nos localizar e navegar entre diretórios (pastas) por meio do cmd. Digamos que você armazenou seu "clone" do repositório remoto dentro de uma pasta chamada "Testes", presente na Área de Trabalho. Por padrão, o cmd abre no caminho "C:\Usuários\User", em que "User" seria seu nome ou o nome que colocaram quando o computador estava sendo configurado. Para que possamos chegar até a pasta onde o repositório está armazenado, precisamos de um único comando: cd (change directory). No contexto do exemplo que acabei de descrever, seria algo parecido com isto:

        cd Desktop\Testes

Pronto, agora estamos na pasta em que o repositório foi clonado. Mas, dentro desta pasta, existem outras cinco pastas: "images", "keywords", "reports", "support" e "tests". No diretório "tests" estão localizados todos os arquivos em que foram desenvolvidos os testes, portanto, para rodar os testes, precisamos estar dentro desta pasta. A pasta "keywords" contém todo o desenvolvimento dos casos de teste "por trás dos panos" por assim dizer. Nela, estão todas as keywords criadas por mim para a execução deste projeto, todas elas separadas em arquivos que fazem referência a seus respectivos endpoints. Na pasta reports, é possível encontrar os relatórios dos testes e na "support" existem os arquivos de criação de massas de dados estáticas e dinâmicas, além do "common.robot", que contém algumas keywords utilizadas no escopo completo do projeto. 

Para rodar todos os testes de um determinado endpoint, deve-se seguir a seguinte estrutura. A primeira parte, "robot -d ./reports" indica que estamos rodando um arquivo Robot e que queremos que os relatórios (log, output e report, arquivos descritivos padrões do framework) fiquem armazenados na pasta "reports". A segunda parte indica o caminho a ser seguido a partir do diretório em que o repositório foi clonado para rodar os testes relacionados a cada um dos endpoints, cada um indicado por seu respectivo nome: 

        robot -d ./reports ./tests/login_tests.robot
        robot -d ./reports ./tests/usuarios_tests.robot
        robot -d ./reports ./tests/produtos_tests.robot
        robot -d ./reports ./tests/carrinhos_tests.robot

Outra forma de rodar os testes é através de tags. Cada um dos CTs tem um tag única - no caso deste projeto, um número - que pode ser visualizada no arquivo em que o caso de teste está hospedado. Por meio dessa tag, é possível rodar um único teste, específico, de sua escolha. Nesse caso, sua estrutura muda um pouco. Adiciona-se um comando "-i NOMEDATAG":

        robot -d ./reports -i 13 ./tests/usuarios_tests.robot

Gostaria de ressaltar que, além da aplicação do Robot Framework, como parte do challenge fui desafiado a criar uma biblioteca com algumas funções em Python que deveriam ser implementadas no projeto. Essa biblioteca encontra-se na pasta base deste repositório e tem o nome de "library_python.py". Junto com ela, criei um arquivo em Robot ("consumir_python_lib.robot") para implementar as funções no formato de keyword. 

# 🗺️ Mapa mental da ServeRest<a name="mapa-mental"></a>

Abaixo, encontra-se um mapa mental completo da API Serverest. Por se tratar de um arquivo XMind, recomendo que se faça o download do original e que ele seja explorado no próprio software em que foi criado. Assim, é possível dar zoom e abrir os comentários relacionados a cada um dos códigos de retorno. Para fazer o download, [clique neste link](https://drive.google.com/drive/folders/13jxcINMSRNlr2am2TrL-5vF3NDSuHxCq?usp=sharing).

<div align=center> 

![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/mapa_mental.png)

</div>

# 🔨 Ferramentas e extensões utilizadas<a name="ferramentas"></a>

</div>

<table>
  <tr>
    <td nowrap><strong>Ferramenta</strong></td>
    <td>Função</td>
  </tr>  
  <tr>
    <td>VSCode</td>
    <td>IDE utilizada para desenvolvimento do código e realização de comentários explicando as soluções</td>
  </tr>
  <tr>
    <td>Python</td>
    <td>Linguagem de programação</td>
  </tr>
  <tr>
    <td>Robot Framework</td>
    <td>Framework em Python para automação de testes</td>
  </tr>
  <tr>
    <td>BuiltIn Robot Framework</td>
    <td>Biblioteca de funções nativas do Robot</td>
  </tr>
  <tr>
    <td>Collections Robot Framework</td>
    <td>Biblioteca de funções nativas do Robot</td>
  </tr>
  <tr>
    <td>RequestsLibrary Robot Framework</td>
    <td>Biblioteca para fazer requisições a APIs</td>
  </tr>
  <tr>
    <td>OperatingSystem Robot Framework</td>
    <td>Biblioteca de funções para interação com sistema operacional</td>
  </tr>
  <tr>
    <td>FakerLibrary Robot Framework</td>
    <td>Biblioteca para criação de dados dinâmicos</td>
  </tr>
  <tr>
    <td>Git</td>
    <td>Versionamento do código</td>
  </tr>
  <tr>
    <td>GitHub</td>
    <td>Repositório remoto usado para compartilhar e armazenar código e dados</td>
  </tr>
  <tr>
    <td>CSV Rainbow</td>
    <td>Extensão do VSCode que facilita a leitura de arquivos .csv</td>
  </tr>
  <tr>
    <td>JSON</td>
    <td>Biblioteca do Python que permite a manipulação de arquivos .json</td>
  </tr>
  <tr>
    <td>Prompt de comando</td>
    <td>Usado para rodar o código</td>
  </tr>
</table>

<div align=justify>

# 📚 Referências<a name="referencias"></a>

A estruturação deste projeto no estado em que ele se encontra até o momento foi possível graças às seguintes fontes de conhecimento:

- [Documentação do Python](https://www.python.org/doc/) para consultas relacionadas às funcionalidades da linguagem
- [Documentação do Robot](https://robotframework.org/robotframework/#standard-libraries) para entender o funcionamento e a estrutura de keywords do framework
- [Documentação do Git](https://git-scm.com/doc) para ter em mãos os principais comandos Git
- [Documentação do VSCode](https://code.visualstudio.com/docs) para entender o funcionamento da IDE
- [StackOverflow](https://stackoverflow.com/) para eventuais dúvidas e consulta a erros
- Masterclasses e conteúdo disponibilizado pelo PB da Compass.uol
- [100 days of Python](https://www.udemy.com/course/100-days-of-code/): curso da Udemy que fiz há algum tempo (não cheguei a completar)

# 🎉 Agradecimentos<a name="agradecimentos"></a>

Deixo também meus sinceros agradecimentos às pessoas que colaboraram com este projeto:

- [Emily Lanzarin](https://github.com/eslanzarin) pela troca de ideias e ajuda em dúvidas
- [Silvioney Backes](https://github.com/neybackes) pela troca de ideias e ajuda em dúvidas
- [Matheus Locatelli](https://github.com/matheuslocatelli) pelo acompanhamento e apoio diário
- [Demétrio Webber](https://www.linkedin.com/in/demetriowebberqa/) por compartilhar seu conhecimento da ferramenta de maneira tão didática e acessível

</div>