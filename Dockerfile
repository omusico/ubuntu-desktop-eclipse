FROM dockerfile/ubuntu-desktop

RUN \
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
add-apt-repository -y ppa:webupd8team/java && \
apt-get update && \
apt-get install -y oracle-java8-installer && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /var/cache/oracle-jdk8-installer


RUN wget http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/mars/R/eclipse-java-mars-R-linux-gtk-x86_64.tar.gz -O /tmp/eclipse.tar.gz -q && \
echo 'Installing eclipse' && \
tar -xf /tmp/eclipse.tar.gz -C /opt && \
rm /tmp/eclipse.tar.gz

ADD run /usr/local/bin/eclipse

RUN chmod +x /usr/local/bin/eclipse

# Define working directory.
WORKDIR /data
# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
# Define default command.
CMD ["bash"]