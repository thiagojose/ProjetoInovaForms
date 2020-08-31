*** Settings ***
Documentation     Testar a funcionalidade de cadastro do site Localnews
Resource          ../../resources/Resources.robot
Resource          ../../resources/SetupsTeardowns.robot
Test SETUP        Abrir navegador
Test TEARDOWN     Fechar navegador

*** Test Cases ***

Cenário 01: O que será feito
    [Documentation]    O que será feito de forma mais descritiva
...	                   se julgar necessário
    [Tags]    Resumo do teste

### Passos
    # Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado
	Quando
	Então
	E
	Mas
	Então


Cenário 02: O que será feito
	[Documentation]    O que será feito de forma mais descritiva
...	                   se julgar necessário
    [Tags]    Resumo do teste

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado
	Quando
	Então
	E
	Mas
	Então
