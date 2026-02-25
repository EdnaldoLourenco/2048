# Etapa de construção
FROM alpine:3.20 AS builder

# Instalando curl e unzip
RUN apk add --no-cache curl unzip

# Baixando e descompactando o jogo 2048
WORKDIR /2048
RUN curl -fsSL -o 2048.zip https://codeload.github.com/gabrielecirulli/2048/zip/master \
    && unzip -q 2048.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master 2048.zip

# Etapa final
FROM nginx:1.27-alpine

# Copiando os arquivos para o Nginx
COPY --from=builder /2048 /usr/share/nginx/html

# Verificação simples de disponibilidade da aplicação
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1:80/ || exit 1

# Expondo a porta
EXPOSE 80
