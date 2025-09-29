FROM ubuntu:22.04

# Instalacja podstawowych narzędzi
RUN curl -O https://raw.githubusercontent.com/larctorn1/first-devops-project/refs/heads/main/setup.sh && chmod +x setup.sh && ./setup.sh

# Ustawienie katalogu roboczego
WORKDIR /app

# Kopiowanie plików projektu
COPY . /app

# Domyślny shell
CMD ["/bin/bash"]
