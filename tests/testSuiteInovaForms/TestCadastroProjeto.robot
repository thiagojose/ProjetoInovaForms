*** Settings ***
Documentation     Testar a funcionalidade de cadastro do site Localnews
Resource          ../../resources/Resources.robot
Resource          ../../resources/SetupsTeardowns.robot
Test SETUP        Setus individuais
#Test TEARDOWN     Deslogar e fechar o navegador

*** Test Cases ***

Cenário 01 Cadastro Projeto: Serão preenchidos os campos do projeto para o cadastro
    [Documentation]    Serão preenchidos os campos gerais para cadastro
...	                   do projeto, não incluindo os modais individuais
    [Tags]    Cadastro

### Passos
    # Descreva as chamadas de função aqui utilizando conotação Gherkin
	[SETUP]  Abrir navegador e logar
 	Dado que esteja na tela de criação de projetos
 	Quando clicar em adicionar projeto
	Então serão exibidos e preenchidos os campos para descrever o projeto



Cenário 02 Cadastro Projeto: Incluir dados da Empresa
	[Documentation]    Será criado uma empresa como exemplo
...	                   para incluir no cadastro de projeto
    [Tags]    Cadastro Empresa

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
 	Dado que esteja adicionando um novo projeto
	Quando clicar em Incluir dados da empresa
	Então será exibido a tela de seleção de empresas
	E ao clicar em adicionar empresa
	Então será exibido o formulário para incluir os dados da empresa
	E ao clicar em "Incluir dados da empresa"
	Então a empresa será incluída no formulário de cadastro geral

Cenário 03 Cadastro Projeto: Incluir Histórico
	[Documentation]    Será criado um histórico como exemplo
...	                   para incluir no cadastro de projeto
    [Tags]    Cadastro de Histórico

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja adicionando um novo projeto
	Quando clicar em Incluir Histórico
	Então será exibido a tela de inclusão de histórico
	E ao preenchê-lo e clicar em "Incluir Histórico"
	Então o histórico será incluído no formulário de cadastro geral


Cenário 04 Cadastro Projeto: Incluir Objetivo, Meta e Indicador
	[Documentation]    Será criado um item com Objetivo, Meta e Indicador
...	                   para inclusão no cadastro de projeto
    [Tags]    Cadastro de Objetivo, Meta e Indicador

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja adicionando um novo projeto
	Quando clicar em Incluir Objetivo, Meta e Indicador
	Então será exibido a tela de inclusão de Objetivo, Meta e Indicador
	E ao preenchê-lo e clicar em "Adicionar"
	Então "Objetivo, Meta e Indicador" será incluído no formulário de cadastro geral


Cenário 05 Cadastro Projeto: Adicionar Executor
	[Documentation]    Será adicionado um novo Executor
...	                   para inclusão no cadastro de projeto
    [Tags]    Cadastro de Executor

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja adicionando um novo projeto
	Quando clicar em Adicionar Executor
	Então será exibido a tela de inclusão de Executor
	E ao preenchê-lo e clicar em "Adicionar Executor"
	Então "Executor" será incluído no formulário de cadastro geral


Cenário 06 Cadastro Projeto: Adicionar Perfil de Bolsista
	[Documentation]    Será adicionado um novo Perfil de bolsista
...	                   para inclusão no cadastro de projeto
    [Tags]    Cadastro de Perfil de Bolsista

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja adicionando um novo projeto
	Quando clicar em "Incluir" Perfil de bolsista
	Então será exibido a tela de inclusão Perfil de bolsista
	E ao preenchê-lo e clicar em "Incluir macro ação"
    Então será preenchido o formulário de criação de macro ação
	E ao clicar em adicionar macro ação
	E ao clicar em "Adicionar Perfil de bolsista"
	Então "Perfil de bolsista" será incluído no formulário de cadastro geral


Cenário 07 Cadastro Projeto: Adicionar Macro ação geral
	[Documentation]    Será adicionado uma nova macro ação
...	                   para inclusão no cadastro de projeto
    [Tags]    Cadastro de Macro ação

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja adicionando um novo projeto
	Quando clicar em "Incluir" Macro ação
	Então será exibido a tela de inclusão de macro ação
	E ao preenchê-la e clicar em "Incluir macro ação"
	Então a macro ação será adicionada ao formulário geral
    E o formulário geral será enviado

# Cenário 02: O que será feito
# 	[Documentation]    O que será feito de forma mais descritiva
# ...	                   se julgar necessário
#     [Tags]    Resumo do teste
#
# ### Passos
# 	# Descreva as chamadas de função aqui utilizando conotação Gherkin
# 	Dado
# 	Quando
# 	Então
# 	E
# 	Mas
# 	Então
