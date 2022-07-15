![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/compass.png)

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
- [Rodando os testes no cmd](#cmd)
- [Ferramentas e extensões utilizadas](#ferramentas)
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

# 🕵️ Rodando os testes no cmd<a name="cmd"></a>

Para começar a rodar os testes, é importante entender uma coisa. Para que possamos ter mais controle sobre os dados que estamos enviando e recebendo, é mais interessante interagir com a ServeRest de forma local. Assim, estaremos manipulando apenas a massa de dados que nós mesmos criamos. Para que isso aconteça, abra o cmd e digite:

        npx serverest

Em poucos segundos a ferramenta iniciará de maneira local e abrirá uma aba com o endereço "localhost:3000" no seu navegador padrão. *IMPORTANTE*: mantenha o cmd em que este comando foi executado aberto, é ele que mantém o sistema rodando de maneira local. Para executar todos os próximos passos, abra um outro cmd.

Antes de passar para a execução em si dos arquivos, precisamos entender um pouco sobre como podemos nos localizar e navegar entre diretórios (pastas) por meio do cmd. Digamos que você armazenou seu "clone" do repositório remoto dentro de uma pasta chamada "Testes", presente na Área de Trabalho. Por padrão, o cmd abre no caminho "C:\Usuários\User", em que "User" seria seu nome ou o nome que colocaram quando o computador estava sendo configurado. Para que possamos chegar até a pasta onde o repositório está armazenado, precisamos de um único comando: cd (change directory). No contexto do exemplo que acabei de descrever, seria algo parecido com isto:

        cd Desktop\Testes

Pronto, agora estamos na pasta em que o repositório foi clonado. Mas, dentro desta pasta, existem outras duas pastas: "images" e "tests". No diretório "tests" estão localizados todos os arquivos em que foram desenvolvidos os testes, portanto, para rodar os testes, precisamos estar dentro desta pasta. Para isso, simplesmente precisamos executar o comando cd mais uma vez:

        cd tests

Agora sim estamos prontos para rodar os arquivos Robot. Vale ressaltar que essa execução sempre virá por meio do mesmo arquivo, o "base.robot". Cada cenário de teste recebeu uma tag, através do qual é possível especificar qual teste queremos rodar (senão, todos rodarão simultaneamente, o que não é o objetivo neste momento). O arquivo "base.robot" é o ponto principal através do qual todo o código desenvolvido em outros arquivos é centralizado. Nele, são descritos todos os cenários de teste, cada um com sua respectiva tag. Digamos que eu quero testar se é possível criar um novo usuário no endpoint /usuarios. Como a tag desse cenário de teste é POSTUSER, o comando no cmd seria o seguinte:

        robot -d ./reports -i POSTUSER base.robot

A primeira parte, "robot -d ./reports" indica que estamos rodando um arquivo Robot e que queremos que os relatórios (log, output e report, arquivos descritivos padrões do framework) fiquem armazenados na pasta "reports". A segunda parte, "-i POSTUSER", indica que queremos rodar o cenário de teste que está relacionado com a tag POSTUSER. Por fim, o arquivo "base.robot", como mencionado anteriormente, é o arquivo principal através do qual todos os testes são executados. Dentre todas as palavras envolvidas nessa estrutura, a única que muda entre execuções é a tag. De resto, a estrutura é a mesma (a não ser que você queira rodar todos os testes simultaneamente, nesse caso, execute o mesmo comando sem a parte do "-i TAG". Porém, como já comentei, isso não seria interessante no contexto dos testes desenvolvidos para este repositório).

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

- [Silvioney Backes](https://github.com/neybackes) pela troca de ideias e ajuda em dúvidas
- [Matheus Locatelli](https://github.com/matheuslocatelli) pelo acompanhamento e apoio diário
- [Demétrio Webber](https://www.linkedin.com/in/demetriowebberqa/) por compartilhar seu conhecimento da ferramenta de maneira tão didática e acessível

</div>