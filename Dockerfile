FROM debian:jessie
LABEL maintainer="Sanket Bajoria <bajoriasanket@gmail.com>"
WORKDIR /app
RUN apt-get update && apt-get install -y fonts-freefont-ttf fonts-liberation fonts-noto fonts-dejavu fonts-dejavu-core fonts-dejavu-extra libgs9-common=9.06~dfsg-2+deb8u7 libgs9=9.06~dfsg-2+deb8u7 ghostscript=9.06~dfsg-2+deb8u7 && apt-get clean
CMD ["gs"]
