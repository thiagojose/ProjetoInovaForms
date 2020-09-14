*** Variables ***




${XPATHADICIONARPROJETO}    //a[@href="/projetos/cadastrar"]

${TEXTOPAGINAPROJETO}       Meus projetos
${TEXTONOVOPROJETO}         Novo projeto

# DADOS GERAIS DE CADASTRO

${IDPROJETOCARGO}           cargo_coordenador
${PROJETOCARGO}             ${TEXTO}

${IDPROJETOLATTES}          link_coordenador
${PROJETOLATTES}            ${URLGEN}

${IDPROJETOHORASSEM}        horas_dedicadas_coordenador
${PROJETOHORASSEM}          1

${IDPROJETORESP}            coordenador_resposabilidades
${PROJETORESP}              ${TEXTO}

${IDPROJETOTITULO}          titulo
${PROJETOTITULO}            ${TEXTO}

${IDPROJETOPCHAVES}         palavra_chave
${PROJETOPCHAVES}           ${TEXTO}

${IDPROJETOOBJETIVO}        objetivo
${PROJETOOBJETIVO}          ${TEXTO}

${IDPROJETOSETORSELECT}     setor
${PROJETOSETORSELECT}       Automotivo

${IDPROJETORELEVANCIA}      relevancia
${PROJETORELEVANCIA}        ${TEXTO}

${IDPROJETOINOVASELECT}     tipo_inovacao
${PROJETOINOVASELECT}       Processo

${IDPROJINOVAGRAUSELECT}    grau_inovacao
${PROJINOVAGRAUSELECT}      Radical

${IDPROJETOMETODOLOGIA}     metodologia
${PROJETOMETODOLOGIA}       ${TEXTO}

${IDPROJETOIMPACTO}         impactos
${PROJETOIMPACTO}           ${TEXTO}

${NAMEPROJETOVIABITEC}      visibilidade_tecnica
${PROJETOVIABITEC}          ${TEXTO}

${NAMEPROJETOVIABIECO}      visibilidade_economica
${PROJETOVIABIECO}          ${TEXTO}

${IDPROJETORECURSOST}       recursosTerceiros
${PROJETORECURSOST}         1

${IDPROJETORECURSOSP}       recursosProprios
${PROJETORECURSOSP}         1

${NAMEPROJETODESAFIOSP}     desafio_bolsistas
${PROJETODESAFIOSP}         ${TEXTO}

${XPATHPROJETOANALISE}      //form/div/div[7]/div[1]/div[1]/label[@for="analise_iel_sim"]

${NAMEPROJREGIONALSELECT}   regional_iel
${PROJREGIONALSELECT}       Alagoas - ( AL )


${IDPROJETOINCCNAE}                   link-cnae-selecao
${IDPROJETOALGUMCNAE}                 cnae-2
${XPATHPROJETOAREACONHECIMENTO}       //form/div/div[4]/div[3]/div[3]/a/span
${IDPROJETOALGUMAAREACONHECIMENTO}    areas-conhecimento-53
${XPATHPROJETOAREACORRELATA}          //form/div/div[4]/div[4]/a/span
${IDPROJETOALGUMAAREACORRELATA}       areas-correlatas-929


@{DADOSPROJETOCLIQUES}    ${IDPROJETOINCCNAE}  ${IDPROJETOALGUMCNAE}  ${XPATHPROJETOAREACONHECIMENTO}
...                       ${IDPROJETOALGUMAAREACONHECIMENTO}  ${XPATHPROJETOAREACORRELATA}
...                       ${IDPROJETOALGUMAAREACORRELATA}

&{DADOSPROJETO}    ${IDPROJETOCARGO}=${PROJETOCARGO}  ${IDPROJETOLATTES}=${PROJETOLATTES}
...                ${IDPROJETOHORASSEM}=${PROJETOHORASSEM}  ${IDPROJETORESP}=${PROJETORESP}
...                ${IDPROJETOTITULO}=${PROJETOTITULO}  ${IDPROJETOPCHAVES}=${PROJETOPCHAVES}
...                ${IDPROJETOOBJETIVO}=${PROJETOOBJETIVO}  ${IDPROJETORELEVANCIA}=${PROJETORELEVANCIA}
...                ${IDPROJETOMETODOLOGIA}=${PROJETOMETODOLOGIA}  ${IDPROJETOIMPACTO}=${PROJETOIMPACTO}
...                ${NAMEPROJETOVIABITEC}=${PROJETOVIABITEC}  ${NAMEPROJETOVIABIECO}=${PROJETOVIABIECO}
...                ${IDPROJETORECURSOST}=${PROJETORECURSOST}  ${IDPROJETORECURSOSP}=${PROJETORECURSOSP}
...                ${NAMEPROJETODESAFIOSP}=${PROJETODESAFIOSP}

&{DADOSPROJETOSELECT}    ${IDPROJETOSETORSELECT}=${PROJETOSETORSELECT}
...                      ${IDPROJETOINOVASELECT}=${PROJETOINOVASELECT}
...                      ${IDPROJINOVAGRAUSELECT}=${PROJINOVAGRAUSELECT}
...                      ${NAMEPROJREGIONALSELECT}=${PROJREGIONALSELECT}

${XPATHENVIARPROJETO}        //form/div/button[@class="pp-btn pp-enabled"]
${XPATHPROJETOADICIONADO}    //div/b[text() = "${PROJETOTITULO}"]

# DADOS CADASTRO DE Empresa

${XPATHICLUIREMPRESA}      //*[@id="link-empresa-selecionada"]
${IDINCLUIREMPRESA}        link-empresa-selecionada
${XPATHINCLUIREMPRESA2}    //*[@id="container-empresa-select"]/div/footer/button


${NAMENOMEEMPRESA}           nome_fantasia
${NOMEEMPRESA}               ${TEXTO}

${NAMECNPJEMPRESA}           cnpj
${CNPJEMPRESA}               ${CNPJ_ESTATICO}

${NAMERAZAOSOCIAL}           razao_social
${RAZAOSOCIAL}               ${TEXTO}

${NAMETIPOEMPSELECT}         tipo_empresa
${TIPOEMPSELECT}             Matriz

${NAMEEMPRESAENDERECO}       endereco
${EMPRESAENDERECO}           ${TEXTO}

${NAMEEMPRESAUFSELECT}       uf
${EMPRESAUFSELECT}           Minas Gerais - ( MG )

${IDEMPRESACEP}              cep
${EMPRESACEP}                32222222

${NAMEEMPRESACIDADE}         cidade
${EMPRESACIDADE}             ${TEXTO}

${NAMEEMPRESAINSCM}          inscricao_municipal
${EMPRESAINSCM}              ${TEXTO}

${NAMEEMPRESAINSCES}         inscricao_estadual
${EMPRESAINSCES}             ${TEXTO}

${NAMEEMPRESALINKCNPQ}       link_cnpq
${EMPRESALINKCNPQ}           ${URLGEN}

${NAMEEMPRESANFUNC}          numero_funcionarios
${EMPRESANFUNC}              5

${NAMEEMPRESASITE}           site
${EMPRESASITE}               ${URLGEN}

${NAMEEMPRESAPORTESELECT}    porte
${EMPRESAPORTESELECT}        Grande empresa: Receita operacional bruta anual ou renda anual: Maior que R$ 300 milhões

${NAMEEMPRESAFUNDACAO}       ano_fundacao
${EMPRESAFUNDACAO}           10101990

${NAMEEMPRESAMISSAO}         missao
${EMPRESAMISSAO}             ${TEXTO}

${NAMEEMPRESAVISAO}          visao
${EMPRESAVISAO}              ${TEXTO}

${XPATHEMPRFILIAISCHECK}     //*[@id="checkbox-estados-filiais"]/div[13]/label
${XPATHEMPFILIAISOPEN}       //*[@id="form-cadastrar-empresa"]/a

${NAMEEMPHISTORICOINOVA}     historico_inovacao
${EMPHISTORICOINOVA}         ${TEXTO}

${XPATHEMPRESAINCCNAE}       //*[@id="form-cadastrar-empresa"]/span/div/a/span

${XPATHEMPRESAALGUMCNAE}     //*[@id="cnae-empresa-6"]/a/div/div

&{DADOSEMPRESA}    ${NAMENOMEEMPRESA}=${NOMEEMPRESA}  ${NAMECNPJEMPRESA}=${CNPJEMPRESA}
...                ${NAMERAZAOSOCIAL}=${RAZAOSOCIAL}  ${NAMEEMPRESAENDERECO}=${EMPRESAENDERECO}
...                ${IDEMPRESACEP}=${EMPRESACEP}  ${NAMEEMPRESACIDADE}=${EMPRESACIDADE}
...                ${NAMEEMPRESAINSCM}=${EMPRESAINSCM}  ${NAMEEMPRESAINSCES}=${EMPRESAINSCES}
...                ${NAMEEMPRESALINKCNPQ}=${EMPRESALINKCNPQ}  ${NAMEEMPRESANFUNC}=${EMPRESANFUNC}
...                ${NAMEEMPRESANFUNC}=${EMPRESANFUNC}  ${NAMEEMPRESASITE}=${EMPRESASITE}
...                ${NAMEEMPRESAFUNDACAO}=${EMPRESAFUNDACAO}  ${NAMEEMPRESAMISSAO}=${EMPRESAMISSAO}
...                ${NAMEEMPRESAVISAO}=${EMPRESAVISAO}  ${NAMEEMPHISTORICOINOVA}=${EMPHISTORICOINOVA}

&{DADOSEMPRESASELECT}    ${NAMETIPOEMPSELECT}=${TIPOEMPSELECT}
...                      ${NAMEEMPRESAUFSELECT}=${EMPRESAUFSELECT}
...                      ${NAMEEMPRESAPORTESELECT}=${EMPRESAPORTESELECT}


${XPATHADICIONAREMPRESA}     //*[@id="form-cadastrar-empresa"]/footer/button

# DADOS CADASTRO DE histórico

${XPATHICLUIRHISTORICO}      //div/a[@class="pp-action-add pp-no-margin-top pp-pipe-ico-task"]

${IDHISTTITULO}         titulo_projeto
${HISTTITULO}           ${TEXTO}

${NAMEHISTINOVA}        inovacao_desenvolvida
${HISTINOVA}            ${TEXTO}

${IDHISTVIGENCIAINI}    vigencia_inicio
${HISTVIGENCIAINI}      ${DATAGEN}

${IDHISTVIGENCIAFIM}    vigencia_fim
${HISTVIGENCIAFIM}      ${DATAGEN}

${NAMEHISTVALOR}        valor_total_projeto
${HISTVALOR}            ${NUMERO}

${NAMEHISTAPORTE}       aporte_empresa
${HISTAPORTE}           ${NUMERO}

&{DADOSHISTORICO}    ${IDHISTTITULO}=${HISTTITULO}  ${NAMEHISTINOVA}=${HISTINOVA}
...                  ${IDHISTVIGENCIAINI}=${HISTVIGENCIAINI}  ${IDHISTVIGENCIAFIM}=${HISTVIGENCIAFIM}
...                  ${NAMEHISTVALOR}=${HISTVALOR}  ${NAMEHISTAPORTE}=${HISTAPORTE}

${XPATHADICIONARHISTORICO}     //*[@id="form-cadastrar-historico"]/footer/button
${XPATHHISTORICOADICIONADO}    //*[@id="historicos-selecionados"]/div

# DADOS CADASTRO DE Objetivo, Meta e Indicador

${XPATHABRIROBJMETAIND}       //form/div/div[4]/div[1]/a[@class="pp-action-add pp-no-margin-top pp-pipe-ico-pipefy"]

${XPATHOBJMETAINDOBJETIVO}    //*[@id="form-cadastrar-meta"]/div/label[1]/input
${OBJMETAINDOBJETIVO}         ${TEXTO}

${NAMEOBJMETAINDINDICADOR}    indicador
${OBJMETAINDINDICADOR}        ${TEXTO}

${NAMEOBJMETAINDMETA}         meta
${OBJMETAINDMETA}             ${TEXTO}

&{DADOSOBJMETAIND}    ${XPATHOBJMETAINDOBJETIVO}=${OBJMETAINDOBJETIVO}
...                   ${NAMEOBJMETAINDINDICADOR}=${OBJMETAINDINDICADOR}
...                   ${NAMEOBJMETAINDMETA}=${OBJMETAINDMETA}

${XPATHADICIONAROBJMETAIND}     //*[@id="form-cadastrar-meta"]/footer/button
${XPATHOBJMETAINDADICIONADO}    //*[starts-with(@id, "meta-selecionada")]


# DADOS CADASTRO DE Executor

${XPATHINCLUIREXECUTOR}    //form/div/div[5]/label[2]/a[@class="pp-action-add pp-no-margin-top pp-pipe-ico-pipefy"]

${XPATHEXECUTORNOME}      //*[@id="form-cadastrar-executador"]//input[@name="nome"]
${EXECUTORNOME}           ${TEXTO}

${XPATHEXECUTORCPF}       //*[@id="form-cadastrar-executador"]//input[@name="cpf"]
${EXECUTORCPF}            ${CPF_ESTATICO}

${XPATHEXECUTORLATTES}    //*[@id="form-cadastrar-executador"]//input[@name="link_lates"]
${EXECUTORLATTES}         ${URLGEN}

${XPATHEXECUTORHORAS}     //*[@id="form-cadastrar-executador"]//input[@name="horas_dedicadas"]
${EXECUTORHORAS}          ${NUMERO}

${XPATHEXECTITSELECT}     //*[@id="form-cadastrar-executador"]//select[@name="titulacao"]
${EXECTITSELECT}          Mestre

${XPATHEXECUTORFORMAC}    //*[@id="form-cadastrar-executador"]//input[@name="formacao"]
${EXECUTORFORMAC}         ${TEXTO}

${XPATHEXECUTORRESPON}    //*[@id="form-cadastrar-executador"]//textarea[@name="responsabilidades"]
${EXECUTORRESPON}         ${TEXTO}

&{DADOSEXECUTOR}    ${XPATHEXECUTORNOME}=${EXECUTORNOME}  ${XPATHEXECUTORCPF}=${EXECUTORCPF}
...                 ${XPATHEXECUTORLATTES}=${EXECUTORLATTES}  ${XPATHEXECUTORHORAS}=${EXECUTORHORAS}
...                 ${XPATHEXECUTORFORMAC}=${EXECUTORFORMAC}  ${XPATHEXECUTORRESPON}=${EXECUTORRESPON}

&{DADOSEXECUTORSELECT}    ${XPATHEXECTITSELECT}=${EXECTITSELECT}

${XPATHADICIONAREXECUTOR}     //*[@id="form-cadastrar-executador"]/div/footer/button
${XPATHEXECUTORADICIONADO}    //*[starts-with(@id, "executadores-selecionados")]


# DADOS CADASTRO DE Perfil Bolsista

${XPATHINCLUIRPBOLSISTA}    //div[6]/label[2]/a[@class="pp-action-add pp-no-margin-top pp-pipe-ico-pipefy"]

${XPATHPBOLSISTAMODALIDADE}    //*[@id="form-cadastrar-perfil-bolsista"]//select[@name="modalidade"]
${PBOLSISTAMODALIDADE}         Graduando SET -G- R$ 2.500,00

${XPATHPBOLSISTADURACAO}       //*[@id="form-cadastrar-perfil-bolsista"]//select[@name="duracao_bolsa"]
${PBOLSISTADURACAO}            12

${XPATHPBOLSISTAQUANTIDADE}    //*[@id="form-cadastrar-perfil-bolsista"]//input[@name="quantidade_bolsas"]
${PBOLSISTAQUANTIDADE}         ${NUMERO}

${XPATHPBOLSISTAPERFIL}        //*[@id="form-cadastrar-perfil-bolsista"]//textarea[@name="perfil_bolsistas"]
${PBOLSISTAPERFIL}             ${TEXTO}

${XPATHPBOLSISTACIDADE}        //*[@id="form-cadastrar-perfil-bolsista"]//input[@name="cidade"]
${PBOLSISTACIDADE}             ${TEXTO}

${XPATHPBOLSISTAESTADO}        //*[@id="form-cadastrar-perfil-bolsista"]//select[@name="estado"]
${PBOLSISTAESTADO}             Minas Gerais - MG

&{DADOSPERFILBOLSISTASELECT}    ${XPATHPBOLSISTAMODALIDADE}=${PBOLSISTAMODALIDADE}  ${XPATHPBOLSISTADURACAO}=${PBOLSISTADURACAO}
...                             ${XPATHPBOLSISTAESTADO}=${PBOLSISTAESTADO}

&{DADOSPERFILBOLSISTA}    ${XPATHPBOLSISTAQUANTIDADE}=${PBOLSISTAQUANTIDADE}  ${XPATHPBOLSISTAPERFIL}=${PBOLSISTAPERFIL}
...                       ${XPATHPBOLSISTACIDADE}=${PBOLSISTACIDADE}

${XPATHADICIONARPBOLSISTA}     //*[@id="form-cadastrar-perfil-bolsista"]/footer/button
${XPATHPBOLSISTAADICIONADO}    //*[starts-with(@id, "perfil-bolsista-selecionados")]

${XPATHPBOLSISTAINCLUIRRMACROACAO}    //*[@id="form-cadastrar-perfil-bolsista"]/div/span/div/a[@class="pp-action-add pp-pipe-ico-recruitment-requests"]

${XPATHMACROACAONOOME}          //*[@id="form-cadastrar-macro"]/div//input[@name="titulo"]
${MACROACAONOOME}               ${TEXTO}

${XPATHMACROACAOANOSELECT}      //*[@id="form-cadastrar-macro"]/div//select[@name="ano"]
${MACROACAOANOSELECT}           2021

${XPATHMACROACAOMESCHECK}       //*[@id="form-cadastrar-macro"]/div/div/div[5]/label

${XPATHADICIONARMACROACAO}      //*[@id="form-cadastrar-macro"]/footer/button
${XPATHMACROACAOADICIONADA}     //*[starts-with(@id, "macros-selecionadas-perfil-bolsista")]

# DADOS CADASTRO DE Macro ação

${XPATHINCLUIRMACROACAOGERAL}    //a[@class="pp-action-add pp-pipe-ico-calendar"]
