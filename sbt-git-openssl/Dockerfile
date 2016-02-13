#
# Scala and sbt Dockerfile based on OpenSSL Git
#
# Credits
#   https://github.com/hseeberger/scala-sbt
#   https://github.com/anapsix/docker-alpine-java
#

FROM jwiii/git-openssl

ENV SCALA_VERSION 2.11.7
ENV SBT_VERSION 0.13.9

# Java Version and other ENV
ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=72 \
    JAVA_VERSION_BUILD=15 \
    JAVA_PACKAGE=server-jre \
    JAVA_HOME=/usr/local/java \
    PATH=${PATH}:/usr/local/java/bin:/usr/local/sbt/bin \
    LANG=C.UTF-8

# Install scala
RUN \
    mkdir -p /usr/local/scala && \
    curl -o /tmp/scala-$SCALA_VERSION.tgz http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz && \
    tar -xf /tmp/scala-$SCALA_VERSION.tgz -C /usr/local/scala --strip-components=1

# Install sbt
RUN \
    mkdir -p /usr/local/sbt && \
    curl -k -L -o /tmp/sbt-$SBT_VERSION.tgz https://dl.bintray.com/sbt/native-packages/sbt/$SBT_VERSION/sbt-$SBT_VERSION.tgz && \
    tar -xf /tmp/sbt-$SBT_VERSION.tgz -C /usr/local/sbt --strip-components=1 && \
    chmod u+x /usr/local/sbt/bin/sbt

# Install java
RUN mkdir -p /usr/local/java && \
    curl -jkSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
    tar xzf /tmp/java.tar.gz -C /usr/local/java --strip-components=1 && \
    rm -rf /usr/local/java/jre/plugin \
           /usr/local/java/jre/bin/javaws \
           /usr/local/java/jre/bin/jjs \
           /usr/local/java/jre/bin/keytool \
           /usr/local/java/jre/bin/orbd \
           /usr/local/java/jre/bin/pack200 \
           /usr/local/java/jre/bin/policytool \
           /usr/local/java/jre/bin/rmid \
           /usr/local/java/jre/bin/rmiregistry \
           /usr/local/java/jre/bin/servertool \
           /usr/local/java/jre/bin/tnameserv \
           /usr/local/java/jre/bin/unpack200 \
           /usr/local/java/jre/lib/javaws.jar \
           /usr/local/java/jre/lib/deploy* \
           /usr/local/java/jre/lib/desktop \
           /usr/local/java/jre/lib/*javafx* \
           /usr/local/java/jre/lib/*jfx* \
           /usr/local/java/jre/lib/jfr* \
           /usr/local/java/jre/lib/amd64/libdecora_sse.so \
           /usr/local/java/jre/lib/amd64/libprism_*.so \
           /usr/local/java/jre/lib/amd64/libfxplugins.so \
           /usr/local/java/jre/lib/amd64/libglass.so \
           /usr/local/java/jre/lib/amd64/libgstreamer-lite.so \
           /usr/local/java/jre/lib/amd64/libjavafx*.so \
           /usr/local/java/jre/lib/amd64/libjfx*.so \
           /usr/local/java/jre/lib/ext/jfxrt.jar \
           /usr/local/java/jre/lib/ext/nashorn.jar \
           /usr/local/java/jre/lib/oblique-fonts \
           /usr/local/java/jre/lib/plugin.jar \
           /tmp/* /var/cache/apk/*

