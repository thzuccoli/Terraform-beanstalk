# Resumo do projeto

Utilizando Terraform para provisionamento e AWS como provedor da infraestrutura (utilização do beanstalk).

## 🔨 Funcionalidades do projeto

A partir desse projeto você pode:

- Criar ambientes para aplicações Docker
- Separar o seu codigo em 2 ambientes, um de produção e um de homologação
- Configurar maquinas para executar um container com uma API em Django automaticamente
- Preparar uma infraestrutura elastica

## ✔️ Técnicas e tecnologias utilizadas

Neste App são exploradas as seguintes técnicas e tecnologias:

- **Criação de maquinas para executar containers Docker: criação de maquinas virtuias no ambiente EC2 (Elastic Compute Cloud) da AWS feito de forma automatica pelo Elastic Beanstalk
- **Criação de imagens Docker: criação das imagens a serem utilizadas pelo Docker
- **Elastic Constainer Registry: o repositorio de containers da AWS, onde vamos colocar as nossas imagens
- **Separação de ambientes: 2 ambientes separados, construidos de forma automatica pelo Terraform, reultilizando codigo.

## 🛠️ Abrir e rodar o projeto

O projeto foi desenvolvido no VSC (Visual Studio Code), sendo assim, instale o VSC (pode ser uma versão mais recente) e, na tela inicial, procure a opção extenções, ou aperte Ctrl+Shift+X, e busque por HashiCorp Terraform, assim teremos o suporte do intellisense, tornando o trabalho de escrever o código mais rapido.

> Caso baixou o zip, extraia o projeto antes de procurá-lo, pois não é possível abrir via arquivo zip

Vá até a paste a abra a pasta do projeto. Apos abrir o projeto abra um terminal, pode ser o integrado com o VSC, navegue até as pastas `infra/`,`env/Prod` e `env/DEV` e execute o comando `terraform init` dentro delas, agora temos o terraform iniciado e podemos começar a ultiliza-lo. Para criar a infraestrutura, execute o terraform apply em uma das pastas de Produção (`env/Prod`) ou de Desenvolvimento (`env/DEV`) de acordo com o ambiente desejado.🏆

## 📚 Mais informações do curso

<!--Gostou do projeto e quer conhecer mais? Você pode [acessar o curso que desenvolve o projeto desde o começo](https://www.alura.com.br/curso-online-kotlin-orientacao-objetos)!-->

<!--Esse curso faz parte da [formação de Kotlin da Alura](https://www.alura.com.br/formacao-kotlin)-->
