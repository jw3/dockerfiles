FROM armhf/debian:jessie

ENV \
    JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=91 \
    JAVA_VERSION_BUILD=14 \
    JAVA_PACKAGE=jdk \
    ARCH=32 \
    JAVA_HOME=/usr/local/java \
    PATH=${PATH}:/usr/local/java/bin \
    LANG=C.UTF-8

RUN \
    mkdir /usr/local/java && \
    curl -jkSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
    http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-arm${ARCH}-vfp-hflt.tar.gz && \
    tar xzf /tmp/java.tar.gz -C /usr/local/java --strip-components=1  && \
    rm -rf /tmp/*
