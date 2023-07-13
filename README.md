# Projeto Final de Topicos Avançados III - IA na Saúde

O Objetivo deste estudo   aplicar algoritmos supervisionados de machine learning, no [data-set derivado da pesquisa do Transtorno do Espectro Autista](https://archive.ics.uci.edu/dataset/426/autism+screening+adult) com a esperança de classificar novas observações nas categorias de “Tem TEA” ou “Não Tem TEA” (no caso deste estudo, essas observações seriam novos indivíduos que passaram pelo processo de triagem de TEA).

## Resultados da Análise

Os resultados completos da análise podem ser encontrados no arquivo [autism_prediction.html](src/autism_prediction.html).

Clique [aqui](http://topicos-avancados-ia.s3-website.eu-central-1.amazonaws.com/) para acessar o arquivo HTML hospedado na AWS S3.


## Pré-requisitos

  **Conta AWS**: Para realizar o deploy dos recursos de infraestrutura na AWS, você precisa ter uma conta ativa. Se você ainda não tem uma conta, você pode criar uma acessando [AWS Free Tier](https://aws.amazon.com/free/) e seguindo as instruções de criação de uma nova conta.

**AWS CLI**: A AWS Command Line Interface (CLI) é uma ferramenta que permite interagir com os serviços da AWS a partir da linha de comando. Certifique-se de ter a AWS CLI instalada e configurada em seu ambiente. Você pode seguir o guia oficial da AWS para instalar e configurar a AWS CLI em sua máquina: [Configuração da AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)

**Make**: O Make é uma ferramenta de automação de tarefas amplamente utilizada. Certifique-se de ter o Make instalado em seu sistema. Dependendo do seu sistema operacional, a instalação do Make pode variar. No Linux ou MacOS, geralmente o Make já está disponível. No Windows, você pode instalar o Make por meio do [Cygwin](https://www.cygwin.com/) ou [MinGW](http://mingw.org/).

**Terraform**: O Terraform é uma ferramenta de infraestrutura como código que permite criar, alterar e configurar recursos de infraestrutura de forma declarativa. Certifique-se de ter o Terraform instalado em seu sistema. Você pode baixar e instalar o Terraform no site oficial: [Download do Terraform](https://www.terraform.io/downloads.html)



- [Python 3.8](https://www.python.org/downloads/) or later
- [AWS CLI](https://aws.amazon.com/cli/)
- [Make](https://www.gnu.org/software/make/) (for managing tasks with Makefile)
- [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) (for managing and deploying infra resources)


## Estrutura do Projeto

```
.
├── Dockerfile
├── LICENSE
├── Makefile
├── README.md
├── configs.ini
├── data
│   ├── Autism-Adult-Data.arff
│   └── Autism-Screening-Adult-Data Description.docx
├── pyproject.toml
├── requirements.txt
├── src
│   ├── __init__.py
│   ├── autism_prediction.html
│   └── autism_prediction.ipynb
└── terraform
    ├── backend.tf
    ├── main.tf
    ├── modules
    │   └── tags
    │       ├── outputs.tf
    │       └── variables.tf
    ├── networking.tf
    └── variables.tf
```


- `src`: Contém o notebook com código e ouptut do experimento.
- `terraform/`: contém os módulos e código terraform para provisionar os recursos do projeto.
- `Makefile`: Arquivo que contém uma série de funções pré-definidas para setup do ambiente de desenvolvimento e deploy.
- `configs.ini`: Arquivo de configuração contendo versão do python necessária.


## Configuração Inicial

1. **Clone o repositório**: com a estrutura e os arquivos do projeto.
2. **Configurar as credenciais da AWS CLI**: Execute o comando `aws configure` e siga as instruções para configurar suas credenciais da AWS CLI. Certifique-se de ter as credenciais corretas para acessar sua conta AWS.
3. Execute `make init` para criar um ambiente virtual, instalar os pacotes Python necessários e configurar os hooks do pre-commit.

# Setup do Ambiente
A configuração do ambiente envolve a instalação de dependências e a configuração das ferramentas necessárias para executar o projeto.

1. **Instalar as dependências do projeto**: No diretório raiz do projeto, execute `make init` para criar um ambiente virtual, instalar os pacotes Python necessários e configurar os hooks do pre-commit.

2. **Verificar a versão do Python**: Execute o comando `make check_installed_python` para verificar se a versão do Python instalada no seu ambiente corresponde à versão especificada no arquivo `configs.ini`.

## Execução do Notebook

Para executar o notebook e reproduzir o experimento, siga as etapas abaixo:

1. No diretório src, abra o arquivo autism_prediction.ipynb em um ambiente Jupyter Notebook. Certifique-se de ter o Jupyter Notebook instalado em seu ambiente.

2. Siga as instruções no notebook para carregar o dataset, realizar a pré-processamento dos dados, treinar os modelos de machine learning e avaliar o desempenho dos modelos.


## Implantação do HTML Estático
Para implantar o HTML estático como um site, siga as etapas abaixo:

1. Certifique-se de ter configurado corretamente as credenciais da AWS CLI.

2. No diretório raiz do projeto, execute o comando `make deploy`. Isso irá criar os recursos de infraestrutura na AWS usando o Terraform e implantar o HTML estático no S3.

3. Após a conclusão do deploy, você receberá uma URL para acessar o site estático. Abra o navegador e acesse essa URL para visualizar o HTML.

Certifique-se de revisar os arquivos de configuração do Terraform no diretório `terraform` e ajustar os valores de acordo com suas preferências e necessidades específicas antes de executar o comando `make deploy`.


## Conclusão

Com as etapas acima, você estará pronto para reproduzir o notebook e implantar o HTML estático como um site na AWS. Sinta-se à vontade para explorar o código, fazer ajustes e personalizações conforme necessário.
