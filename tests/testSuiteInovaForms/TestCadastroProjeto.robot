*** Settings ***
Documentation     Testar a funcionalidade de cadastro do site Localnews
Resource          ../../resources/Resources.robot
Resource          ../../resources/SetupsTeardowns.robot
Test SETUP        Abrir navegador e logar
#Test TEARDOWN     Deslogar e fechar o navegador

*** Test Cases ***

Cenário 01 Cadastro: Serão preenchidos os campos do projeto para o cadastro
    [Documentation]    Serão preenchidos os campos gerais para cadastro
...	                   do projeto, não incluindo os modais individuais
    [Tags]    Cadastro

### Passos
    # Descreva as chamadas de função aqui utilizando conotação Gherkin
 	Dado que esteja na tela de criação de projetos
 	Quando clicar em adicionar projeto
 	Então serão exibidos e preenchidos os campos para descrever o projeto



# Cenário 02: Incluir dados da Empresa
# 	[Documentation]    Será criado uma empresa como exemplo
# ...	                   para incluir no cadastro de projeto
#     [Tags]    Cadastro Empresa
#
# ### Passos
# 	# Descreva as chamadas de função aqui utilizando conotação Gherkin
# 	Dado que esteja na tela de criação de projetos
# 	Quando clicar em Incluir dados da empresa
# 	Então será exibido a tela de seleção de empresas
# 	E ao clicar em adicionar empresa
# 	Então será exibido o formulário para incluir os dados da empresa
# 	E ao clicar em "Incluir dados da empresa"
# 	Então esta será incluída no formulário de cadastro geral
#
# Cenário 03: Incluir Histórico
# 	[Documentation]    Será criado um histórico como exemplo
# ...	                   para incluir no cadastro de projeto
#     [Tags]    Cadastro Histórico
#
# ### Passos
# 	# Descreva as chamadas de função aqui utilizando conotação Gherkin
# 	Dado que esteja na tela de criação de projetos
# 	Quando clicar em Incluir Histórico
# 	Então será exibido a tela de inclusão de histórico
# 	E ao preenchê-lo e clicar em "Incluir dados da empresa"
# 	Então este será incluído no formulário de cadastro geral
#
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
