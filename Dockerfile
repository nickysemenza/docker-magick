FROM debian:bullseye-slim
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ca-certificates wget libfuse2 libfreetype6 libglib2.0-0 libfontconfig libx11-6 imagemagick
RUN update-ca-certificates
# https://debian.pkgs.org/11/multimedia-main-amd64/imagemagick-7_7.1.0.4-dmo1_amd64.deb.html
RUN echo "deb http://www.deb-multimedia.org bullseye main" > /etc/apt/sources.list.d/backports.list
RUN apt-get update -oAcquire::AllowInsecureRepositories=true
RUN apt-get install -y deb-multimedia-keyring --allow-unauthenticated
RUN apt-get install -y imagemagick-7 --allow-unauthenticated
RUN wget https://imagemagick.org/download/binaries/magick && \
	chmod +x magick && \
	mv magick /usr/local/bin/magick

# latex too
RUN apt-get install -y texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra
# other useful utils
RUN apt-get install -y unzip postgresql

# check paths
RUN which pdflatex
RUN which magick
