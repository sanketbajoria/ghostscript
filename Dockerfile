FROM debian:jessie

LABEL maintainer="Sanket Bajoria <bajoriasanket@gmail.com>"

WORKDIR /app

ENV JAVA_HOME="/opt/jdk" PATH="/opt/jdk/bin:${PATH}"

ADD icc /usr/share/ghostscript/icc
ADD def /usr/share/ghostscript/def

RUN apt-get update && apt-get install -y curl unzip fonts-freefont-ttf fonts-liberation fonts-noto fonts-dejavu fonts-dejavu-core fonts-dejavu-extra libgs9-common=9.06~dfsg-2+deb8u7 libgs9=9.06~dfsg-2+deb8u7 ghostscript=9.06~dfsg-2+deb8u7 && curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/server-jre-8u131-linux-x64.tar.gz -o /tmp/java.tar.gz && gunzip /tmp/java.tar.gz && tar -C /opt -xf /tmp/java.tar && mv /opt/jdk1.8.0_131 /opt/jdk && curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip -o /tmp/jce_policy-8.zip && cd /tmp && unzip /tmp/jce_policy-8.zip && cp -v /tmp/UnlimitedJCEPolicyJDK8/*.jar /opt/jdk/jre/lib/security/ && echo 'crypto.policy=unlimited' >> /opt/jdk/jre/lib/security/java.security && apt-get clean

EXPOSE 443

CMD ["java"]
