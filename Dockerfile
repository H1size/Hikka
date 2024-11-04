FROM archlinux:latest as python-base

# Установка необходимых пакетов
RUN pacman -Syu --noconfirm 
    && pacman -S --noconfirm python python-pip ffmpeg git base-devel neofetch 
    && pacman -Scc --noconfirm

# Установка Python-библиотек
RUN pip install --no-cache-dir Pillow requests emoji moviepy python-ffmpeg beautifulsoup4 uvloop

# Создание директории для приложения
RUN mkdir /data

# Копирование файлов в контейнер
COPY . /data/Hikka
WORKDIR /data/Hikka

# Установка зависимостей из requirements.txt
RUN pip install --no-warn-script-location --no-cache-dir -U -r requirements.txt

# Открытие порта
EXPOSE 8080

# Команда для запуска приложения
CMD ["python", "-m", "hikka"]
