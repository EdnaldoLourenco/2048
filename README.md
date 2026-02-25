# 2048 com Docker

Este projeto empacota o jogo 2048 em uma imagem Docker usando build em múltiplas etapas.
A imagem final usa Nginx para servir os arquivos estáticos do jogo.

## Pré-requisitos

- Docker instalado ([guia oficial](https://docs.docker.com/engine/install/)).

## Como executar

### 1) Build da imagem

```bash
docker build -t jogo-2048:latest .
```

### 2) Subir o container

```bash
docker run -d --name jogo-2048 -p 8080:80 jogo-2048:latest
```

### 3) Acessar no navegador

Abra:

```text
http://localhost:8080
```

## Verificações úteis

- Ver containers em execução:

```bash
docker ps
```

- Ver estado do healthcheck:

```bash
docker inspect --format='{{json .State.Health}}' jogo-2048
```

## Melhorias aplicadas neste projeto

- Imagens base com versões explícitas para maior previsibilidade.
- Download do código com `curl -fsSL` para falhar de forma mais segura.
- Adição de `HEALTHCHECK` para monitorar disponibilidade da aplicação.
