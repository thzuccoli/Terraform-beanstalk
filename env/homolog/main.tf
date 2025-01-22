module "Homologacao" {
    source = "../../Infra"

    nome = "homologacao"
    descricao = "aplicacao-de-homologacao"
    max = 2
    maquina = "t2.micro" 
    ambiente = "ambiente-de-homologacao"
}