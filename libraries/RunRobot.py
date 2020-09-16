import sys
import subprocess

COMANDO_BASE = 'robot'

# scuffed auto import, tem que ver isso depois
PROJ_TEARDOWN = 'tests\\suitesTeardown.robot'
IMPORTS_DIR = '-d results\\resultsimports'

# opções de navegador da selenium e o browser padrão a ser utilizado
# caso nenhum browser seja especificado na linha de comando
BROWSER_OPTIONS = ['chrome', 'ie', 'firefox', 'opera', 'edge',
                   'headlesschrome', 'headlessfirefox']
BROWSER_PADRÃO = 'chrome'

# nome/caminho da criação do arquivo junit a ser importado para o aioTests
XML_JUNIT = 'junitoutput.xml'

"""
-d: pasta onde serão colocados os resultados
-v: lista de variáveis a serem sobrescritas no programa,
escritas no padrão: 'NOME:valor', 'NOME2:valor2',
-t: para propósitos de debug, testa um cenário específico apenas,
nome do cenário deve estar dentro de aspas duplas,
exemplo: '-t': '"Cenário 01: O que será feito"',
-L: adiciona maiores detalhes ao log, padrões '' ou 'Trace' para detalhes
"""
COMANDOS_DICIO = {'-d': 'results',
                  '-v': [f'BROWSER:{BROWSER_PADRÃO}',],
                  '-t': '',
                  '-L': '',
                  '-x': XML_JUNIT,
				  '-i': '',}
#				  '--expandkeywords': 'name:SeleniumLibrary.CapturePageScreenshot',}

# pasta geral de testes, normalmente é apenas tests
ARQUIVO_DIR = 'tests'

# diretório para testes de um aplicativo/site específico, se não especificado,
# o teste executará a partir do diretório anterior todos os testes
APLICATIVO_DIR = '/testSuiteInovaForms'

# nome do teste a ser executado, caso não seja especificado,
# o teste executará do diretório anterior todos os testes
NOME_TESTE = ''


def encapsulaComandos():
    """Cria o comando de execução do robot a partir de variáveis globais
       TO DO: adicionar separação de logs por pasta baseado na data/hora
    """
    comando = COMANDO_BASE
    try:
        browser = sys.argv
        if len(browser) > 1:
            for option in browser:
                check_if_option = False
                if option in BROWSER_OPTIONS:
                    check_if_option = True
                    COMANDOS_DICIO['-v'][0] = COMANDOS_DICIO['-v'][0]\
					                          .replace(BROWSER_PADRÃO, option)
                    break
            if not check_if_option:
                raise Exception(f'opção de navegador inválida: {browser[1]}')
    except Exception as e:
        print(f'Erro ao ler a opção de navegador {e}')
        raise Exception(e)

    for tipo, valores in COMANDOS_DICIO.items():
        if valores:
            if isinstance(valores, list):
                for valor in valores:
                    comando += f' {tipo} {valor}'
            else:
                comando += f' {tipo} {valores}'

    comando += f' {ARQUIVO_DIR}{APLICATIVO_DIR}{NOME_TESTE}'
    return comando


if __name__ == '__main__':
    execute = encapsulaComandos()
    try:
        subprocess.run(execute)
#        subprocess.run(f'{COMANDO_BASE} {IMPORTS_DIR} {PROJ_TEARDOWN}')
    except Exception as e:
        print(f'Erro no comando "{execute}", exceção é:{e}')
