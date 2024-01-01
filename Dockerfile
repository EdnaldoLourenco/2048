# Etapa de construção
FROM alpine:latest as builder

# Instalando curl e unzip
RUN apk add --no-cache curl unzip

# Baixando e descompactando o jogo 2048
WORKDIR /2048
RUN curl -o 2048.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master \
    && unzip 2048.zip \
    && mv 2048-master/* . \
    && rm -rf 2048-master 2048.zip

# Etapa final
FROM nginx:alpine

# Copiando os arquivos para o Nginx
COPY --from=builder /2048 /usr/share/nginx/html

# Expondo a porta
EXPOSE 80
