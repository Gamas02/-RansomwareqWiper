# RansomwareqWiper — Atlas de Ameaças Cibernéticas (Dupla 03)

# 

# Contêiner Apache HTTP Server para servir as páginas da dupla, do jeito que serão publicadas no servidor central da turma (item "Ambiente" do enunciado).

# 

# Estrutura

# RansomwareqWiper/

# ├── docker-compose.yml       ← forma recomendada de rodar

# ├── Dockerfile                ← alternativa: gera uma imagem com o site embutido

# ├── README.md

# └── atlas-ameacas/            ← isto é a raiz do site (htdocs)

# &#x20;   ├── index.html             ← índice provisório, só para teste local

# &#x20;   └── dupla03/

# &#x20;       ├── ransomware.html

# &#x20;       ├── wiper.html

# &#x20;       ├── style.css

# &#x20;       └── img/

# 

# A pasta atlas-ameacas/ é exatamente a estrutura descrita no item 7 do enunciado. No servidor real da turma, o professor mantém o index.html central e cada dupla só mexe na própria pasta (dupla03/, no nosso caso).

# 

# Como rodar (recomendado — docker-compose)

# 

# Pré-requisito: Docker e Docker Compose instalados.

# 

# Na raiz do repositório:

# 

# bash

# docker compose up -d

# 

# Acessar no navegador:

# 

# http://localhost:8080/ → índice provisório

# http://localhost:8080/dupla03/ransomware.html

# http://localhost:8080/dupla03/wiper.html

# 

# Para parar:

# 

# bash

# docker compose down

# 

# Como o docker-compose.yml monta a pasta atlas-ameacas/ como volume, qualquer edição nos arquivos HTML/CSS aparece só dar refresh no navegador — não precisa reconstruir nada.

# 

# Alternativa sem compose (Dockerfile)

# 

# Se preferir (ou se o professor pedir uma imagem "fechada", sem depender da pasta local no host), também na raiz do repositório:

# 

# bash

# docker build -t atlas-ameacas .

# docker run -d --name atlas-ameacas -p 8080:80 atlas-ameacas

# 

# Nesse caso, os arquivos ficam copiados dentro da imagem; para atualizar depois de editar o HTML/CSS, é preciso rodar docker build de novo.

# 

# Checando se subiu certo

# bash

# docker ps                     # deve listar o contêiner "atlas-ameacas" rodando

# docker logs atlas-ameacas     # logs do Apache, útil se a porta 8080 já estiver em uso

# 

# Se a porta 8080 já estiver ocupada na sua máquina, troque o lado esquerdo do mapeamento de porta (ex.: "8081:80") no docker-compose.yml ou no docker run.

# 

# Colocando no servidor final da turma

# 

# Quando o professor disponibilizar o contêiner central da turma, o conteúdo que importa entregar é só a pasta dupla03/ (HTML + CSS, sem o index.html provisório nem o docker-compose.yml/Dockerfile daqui, que são apenas para desenvolvimento local). Basta copiar atlas-ameacas/dupla03/ para dentro da pasta correspondente no servidor real.

