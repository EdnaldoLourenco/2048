# 2048
Esse projeto utiliza conceitos do Docker, como criar dockerfile, criar uma imagem do docker, clonar o aplicativo para nossa imagem, em seguida, implantar o aplicativo docker em contêiner na nuvem AZURE, criando um jogo 2048.

Requisitos necessários:
Docker instalado; caso ainda não possua o docker em sua máquina pode fazer a instalação a partir do link: https://docs.docker.com/engine/install/

Para criar a imagem docker:

docker build -t nome:tag .

Criando e Executando o container:

docker run -d -P nome:tag

Para saber em qual porta do está sendo executada a aplicação:

docker ps
![image](https://github.com/EdnaldoLourenco/2048/assets/142667824/c46f1561-316b-4a21-b479-78a80ca6a9f0)

Acesse a aplicação do seu navegador especificando a porta:
localhost:32770

![image](https://github.com/EdnaldoLourenco/2048/assets/142667824/9188b2aa-27d8-4dd5-9899-ae0fb67a7848)
