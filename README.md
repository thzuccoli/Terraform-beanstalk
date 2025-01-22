# Resumo do projeto

Projeto onde houve a implantação de uma API via terraform na AWS usando o elasticbeanstalk

## ✔️ Técnicas e tecnologias utilizadas

Neste App são exploradas as seguintes técnicas e tecnologias:

- Segmentação dos ambientes em modulos (producao e homologacao)
- Criação de um bucket s3 para armazenamento do arquivo responsavel pelo estado da infraestutura (terraform.tfstate) atraves do arquivo /env/prod/backend.tf
- Criação da imagem Docker com a aplicação para subida no ECR (serviço de armazenamento de imagens da AWS) atraves do arquivo /clientes-leo-api/Dockerfile
- Preparo da imagem após o deploy no ECR para subida no beanstalk (criação do arquivo Dockerrun.aws.json e envia-lo para o .zip como producao.zip)
- Criação dos recursos abaixo para provisionamento da infraestrutura na AWS
- **recurso do beanstalk atraves do arquivo /infra/beanstalk.tf (aplicação/ ambiente/ versão da aplicação)
- **recurso do ECR atraves do arquivo /infra/ecr.tf (criação de um repositorio para armazenar as imagens criada)
- **recurso do s3 atraves do arquivo /infra/s3.tf (criação de um bucket para armazenar a imagem .zip que o beanstalk irá ler)
- **recurso para as roles e policy relacionado ao serviço do beanstalk atraves do arquivo /infra/role.tf

## 🛠️ Abrir e rodar o projeto

O projeto foi desenvolvido no VSC (Visual Studio Code), sendo assim, instale o VSC (pode ser uma versão mais recente) e, na tela inicial, procure a opção extenções, ou aperte Ctrl+Shift+X, e busque por HashiCorp Terraform, assim teremos o suporte do intellisense, tornando o trabalho de escrever o código mais rapido.

> Caso baixou o zip, extraia o projeto antes de procurá-lo, pois não é possível abrir via arquivo zip

Vá até a paste a abra a pasta do projeto. Apos abrir o projeto abra um terminal, pode ser o integrado com o VSC, navegue até as pastas `infra/`,`env/Prod` e `env/homolog` e execute o comando `terraform init` dentro delas, agora temos o terraform iniciado e podemos começar a ultiliza-lo. Para criar a infraestrutura, execute o terraform apply em uma das pastas de Produção (`env/Prod`) ou de Homologação (`env/homolog`) de acordo com o ambiente desejado.

Em seguida atualize o ambiente para a ultima versão de produção com:

```aws elasticbeanstalk update-environment --environment-name ambinete-de-producao --version-label ambinete-de-producao```

ou para homologação com:

```aws elasticbeanstalk update-environment --environment-name ambinete-de-homolog --version-label ambinete-de-homolog```

🏆
