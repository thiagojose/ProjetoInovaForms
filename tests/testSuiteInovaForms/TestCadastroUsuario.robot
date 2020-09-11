*** Settings ***
Documentation     Testar a funcionalidade de cadastro do projeto InovaForms
Resource          ../../resources/Resources.robot
Resource          ../../resources/SetupsTeardowns.robot
Test SETUP        Abrir navegador
Test TEARDOWN     Fechar navegador


*** Test Cases ***

Cenário 01 Cadastro Usuário: Cadastrar um novo usuário com sucesso
    [Documentation]    Será feito o cadastro do usuário
...	                   utilizando informações corretas ao sistema
    [Tags]    Cadastro

### Passos
    # Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja na tela inicial do site InovaForms
	Quando clicar em "Criar um novo Usuário"
	Então será redirecionado para a página de cadastro "Novo usuário"
	E ao preencher os campos corretamente e clicar em enviar
	Então será redirecionado para a página de login novamente


Cenário 02 Cadastro Usuário: Falhar cadastro de um novo usuário com sucesso
	[Documentation]    Será feito o preenchimento do formulário de cadastro
...	                   preenchendo todos os campos de forma inválida
    [Tags]    Cadastro

### Passos
	# Descreva as chamadas de função aqui utilizando conotação Gherkin
	Dado que esteja na tela inicial do site InovaForms
	Quando clicar em "Criar um novo Usuário"
	Então será redirecionado para a página de cadastro "Novo usuário"
	E ao preencher os campos incorretamente e clicar em enviar
	Então serão exibidas "6" mensagens de erro
