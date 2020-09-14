*** Settings ***
Library     String
Library     SeleniumLibrary    run_on_failure=Nothing
Resource    CommonForms.robot
Resource    APIRequests.robot
Resource    variables/CommonVars.robot
Resource    POs/POCadastro.robot
Resource    POs/POCadastroProjeto.robot


*** Variables ***

${BROWSER}    chrome
${URL}        https://inovaforms.digitais.sistemaindustria.com.br/
${URL_CADASTRO}    https://inovaforms.digitais.sistemaindustria.com.br/registrar/

*** Keywords ***

Faz nada
    Pass Execution    template

Então é efetuado o login
    Input Text    ${NAMEUSERNAME}    ${EMAIL}
	Input Password    ${IDSENHA}    ${SENHA}
	Click Element    xpath=${XPATHLOGIN}

Então é encerrada a sessão
    Wait Until Page Contains Element    xpath=${XPATHLOGOUT}
    Click Link    xpath=${XPATHLOGOUT}


# Cenário 01 Cadastro Usuário: Cadastrar um novo usuário com sucesso

Dado que esteja na tela inicial do site InovaForms
    Wait Until Page Contains Element    tag=title
    Go to    ${URL}

Quando clicar em "Criar um novo Usuário"
    Click Element    xpath=${XPATHNOVOUSUARIO}

Então será redirecionado para a página de cadastro "${novo_usuario}"
    Wait Until Page Contains Element    tag=title
    Wait Until Page Contains    ${novo_usuario}

E ao preencher os campos corretamente e clicar em enviar
    Preencher campos de texto    campos=${DADOSCADASTRO}
	Preencher senha    campos=${DADOSSENHA1}
	Click Element    name=${NAMESUBMITCADASTRO}

Então será redirecionado para a página de login novamente
    Wait Until Page Contains Element    tag=title
    Page Should Contain Element    xpath=${XPATHLOGIN}


# Cenário 02 Cadastro Usuário: Falhar cadastro de um novo usuário com sucesso

E ao preencher os campos incorretamente e clicar em enviar
	Preencher campos de texto    campos=${DADOSCADASTROERRADOS}
	Preencher senha    campos=${DADOSSENHA2}
	Click Button    name=${NAMESUBMITCADASTRO}

Então serão exibidas "${erros}" mensagens de erro
    ${errosgerados}    Get Element Count    class=${CLASSEERRO}
    Should Be Equal As Integers    ${erros}    ${errosgerados}


# Cenário 01 Cadastro Projeto: Serão preenchidos os campos do projeto para o cadastro

Dado que esteja na tela de criação de projetos
    Page Should Contain    ${TEXTOPAGINAPROJETO}

Quando clicar em adicionar projeto
    Click Element    xpath=${XPATHADICIONARPROJETO}

Dado que esteja adicionando um novo projeto
    Wait Until Page Contains    ${TEXTONOVOPROJETO}

Então serão exibidos e preenchidos os campos para descrever o projeto
    Dado que esteja adicionando um novo projeto
	Preencher campos de texto    campos=${DADOSPROJETO}
    Click Element    ${XPATHPROJETOANALISE}
	Preencher campos de select    campos=${DADOSPROJETOSELECT}
	Muitos cliques seguidos    campos=${DADOSPROJETOCLIQUES}

# Cenário 02 Cadastro Projeto: Incluir dados da Empresa

Quando clicar em Incluir dados da empresa
    Scroll Element Into View    ${XPATHICLUIREMPRESA}
	Mouse Over       ${XPATHICLUIREMPRESA}
    Click Element    xpath=${XPATHICLUIREMPRESA}

Então será exibido a tela de seleção de empresas
    Wait Until Page Contains Element    xpath=${XPATHINCLUIREMPRESA2}

E ao clicar em adicionar empresa
    Click Element    ${XPATHINCLUIREMPRESA2}

Então será exibido o formulário para incluir os dados da empresa
    ${randomcnpj}    Generate Random String    length=14    chars=[NUMBERS]
	Atualiza dicionário    dicio=${DADOSEMPRESA}    chave=${NAMECNPJEMPRESA}
...                        novachave=${NAMECNPJEMPRESA}    valorchave=${randomcnpj}
    Atualiza dicionário    dicio=${DADOSEMPRESA}    chave=${NAMEEMPRESAINSCM}
...                        novachave=${NAMEEMPRESAINSCM}    valorchave=${randomcnpj}
    Atualiza dicionário    dicio=${DADOSEMPRESA}    chave=${NAMEEMPRESAINSCES}
...                        novachave=${NAMEEMPRESAINSCES}    valorchave=${randomcnpj}
    Preencher campos de texto     campos=${DADOSEMPRESA}
	Preencher campos de select    campos=${DADOSEMPRESASELECT}
	Click Element    xpath=${XPATHEMPFILIAISOPEN}
	Click Element    xpath=${XPATHEMPRFILIAISCHECK}
	Click Element    ${XPATHEMPRESAINCCNAE}
	Click Element    ${XPATHEMPRESAALGUMCNAE}

E ao clicar em "Incluir dados da empresa"
    Click Element    ${XPATHADICIONAREMPRESA}

Então a empresa será incluída no formulário de cadastro geral
    Page Should Contain    ${TEXTO}


#Cenário 03 Cadastro Projeto: Incluir Histórico

Quando clicar em Incluir Histórico
	Scroll Element Into View    ${XPATHICLUIRHISTORICO}
	Mouse Over       ${XPATHICLUIRHISTORICO}
	Click Element    xpath=${XPATHICLUIRHISTORICO}

Então será exibido a tela de inclusão de histórico
    Page Should Contain Element    ${IDHISTTITULO}

E ao preenchê-lo e clicar em "Incluir Histórico"
    Preencher campos de texto    campos=${DADOSHISTORICO}
	Click Element    ${XPATHADICIONARHISTORICO}

Então o histórico será incluído no formulário de cadastro geral
    Wait Until Page Does Not Contain Element    ${XPATHADICIONARHISTORICO}
    Page Should Contain Element    ${XPATHHISTORICOADICIONADO}


# Cenário 04 Cadastro Projeto: Incluir Objetivo, Meta e Indicador

Quando clicar em Incluir Objetivo, Meta e Indicador
	Scroll Element Into View    ${XPATHABRIROBJMETAIND}
	Mouse Over       ${XPATHABRIROBJMETAIND}
	Click Element    xpath=${XPATHABRIROBJMETAIND}

Então será exibido a tela de inclusão de Objetivo, Meta e Indicador
	Page Should Contain Element    ${XPATHOBJMETAINDOBJETIVO}

E ao preenchê-lo e clicar em "Adicionar"
    Preencher campos de texto    campos=${DADOSOBJMETAIND}
    Click Element    ${XPATHADICIONAROBJMETAIND}

Então "Objetivo, Meta e Indicador" será incluído no formulário de cadastro geral
    Wait Until Page Does Not Contain Element    ${XPATHADICIONAROBJMETAIND}
    Page Should Contain Element    ${XPATHOBJMETAINDADICIONADO}

# Cenário 05 Cadastro Projeto: Adicionar Executor

Quando clicar em Adicionar Executor
	Scroll Element Into View    ${XPATHINCLUIREXECUTOR}
	Mouse Over       ${XPATHINCLUIREXECUTOR}
	Click Element    xpath=${XPATHINCLUIREXECUTOR}

Então será exibido a tela de inclusão de Executor
    Page Should Contain Element    ${XPATHEXECUTORNOME}

E ao preenchê-lo e clicar em "Adicionar Executor"
    ${cpfaleatorio}    Generate Random String    length=11    chars=[NUMBERS]
    Atualiza dicionário    ${DADOSEXECUTOR}    ${XPATHEXECUTORCPF}
...                        ${XPATHEXECUTORCPF}    ${cpfaleatorio}
    Preencher campos de texto    campos=${DADOSEXECUTOR}
	Preencher campos de select    campos=${DADOSEXECUTORSELECT}
    Click Element    ${XPATHADICIONAREXECUTOR}

Então "Executor" será incluído no formulário de cadastro geral
    Wait Until Page Does Not Contain Element    ${XPATHADICIONAREXECUTOR}
	Page Should Contain Element    ${XPATHEXECUTORADICIONADO}


# Cenário 06 Cadastro Projeto: Adicionar Perfil de Bolsista

Quando clicar em "Incluir" Perfil de bolsista
	Scroll Element Into View    ${XPATHINCLUIRPBOLSISTA}
	Mouse Over       ${XPATHINCLUIRPBOLSISTA}
	Click Element    xpath=${XPATHINCLUIRPBOLSISTA}

Então será exibido a tela de inclusão Perfil de bolsista
    Page Should Contain Element    ${XPATHPBOLSISTAMODALIDADE}

E ao preenchê-lo e clicar em "Incluir macro ação"
    Preencher campos de select    campos=${DADOSPERFILBOLSISTASELECT}
	Preencher campos de texto    campos=${DADOSPERFILBOLSISTA}
    Click Element    ${XPATHPBOLSISTAINCLUIRRMACROACAO}

Então será preenchido o formulário de criação de macro ação
    Input Text    ${XPATHMACROACAONOOME}    ${MACROACAONOOME}
	Select From List By Label    ${XPATHMACROACAOANOSELECT}    ${MACROACAOANOSELECT}
	Click Element    ${XPATHMACROACAOMESCHECK}


E ao clicar em adicionar macro ação
    Click Element    ${XPATHADICIONARMACROACAO}
	Wait Until Page Does Not Contain Element    ${XPATHADICIONARMACROACAO}
	Page Should Contain Element    ${XPATHMACROACAOADICIONADA}

E ao clicar em "Adicionar Perfil de bolsista"
    Click Element    ${XPATHADICIONARPBOLSISTA}

Então "Perfil de bolsista" será incluído no formulário de cadastro geral
    Wait Until Page Does Not Contain Element    ${XPATHADICIONARPBOLSISTA}
	Page Should Contain Element    ${XPATHPBOLSISTAADICIONADO}


# Cenário 07 Cadastro Projeto: Adicionar Macro ação geral

Quando clicar em "Incluir" Macro ação
    Scroll Element Into View    ${XPATHINCLUIRMACROACAOGERAL}
    Click Element    ${XPATHINCLUIRMACROACAOGERAL}

Então será exibido a tela de inclusão de macro ação
    Então será preenchido o formulário de criação de macro ação

E ao preenchê-la e clicar em "Incluir macro ação"
    E ao clicar em adicionar macro ação

Então a macro ação será adicionada ao formulário geral
    Scroll Element Into View    ${XPATHINCLUIRMACROACAOGERAL}

E o formulário geral será enviado
    Click Element    ${XPATHENVIARPROJETO}
	Wait Until Page Does Not Contain Element    ${XPATHENVIARPROJETO}
	Page Should Contain Element    xpath=${XPATHPROJETOADICIONADO}
