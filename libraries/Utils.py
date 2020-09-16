"""
A ideia aqui é criar funções que facilitam o processamento de informações pelo robot
mesmo que dê para fazer no robot, se for muito trabalhoso, basta criar uma função em python,
inserir aqui, e importá-la para evitar código "sujo"
"""


def comparaStrings(s1, s2):
    return s1 == s2


#def pegaArquivo(caminho):
#    raise Exception(open("C:\/Users\/Pichau\/Desktop\/ProjetoLocalnews\/results\/output.xml", "rb").readlines())


def differentPage(hre=""):
    selfpage = True if "#" in hre else False
    return not selfpage and hre != ""


def pegaLinks(pagina_atual):
    """
    Realiza um scrap nos links da página atual
    Retorna todos os links em um elemento "a"
    """
    import re
    from bs4 import BeautifulSoup
    import requests

    pagina = requests.get(pagina_atual)
    dados = pagina.text
    pagina_html = BeautifulSoup(dados, "html.parser")

    links = set()
    for link in pagina_html.find_all('a'):
        clicavel = link.get('href')
        if "http" not in clicavel and re.match('/*/', clicavel):
            pa = pagina_atual.split('/')
            clicavel = f'{pa[0]}//{pa[2]}' + clicavel
        links.add(clicavel)
    return list(links)
