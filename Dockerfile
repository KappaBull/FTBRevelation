
FROM java:88-jre

LABEL maintainer='kappabull <kappabull@gmail.com>'

WORKDIR /minecraft
USER root

RUN apt-get update && \
	apt-get upgrade --yes --force-yes && \
	apt-get clean && \ 
	rm -rf /var/lib/apt/lists/* && \
    useradd -m -U minecraft && \
	mkdir -p /minecraft/world && \
	wget --no-check-certificate https://media.forgecdn.net/files/2545/327/FTBRevelationServer_1.8.0.zip && \
	unzip FTBRevelationServer_1.8.0.zip && \
	rm FTBRevelationServer_1.8.0.zip && \
	chmod u+x FTBInstall.sh ServerStart.sh && \
	echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)." > eula.txt && \
	echo "$(date)" >> eula.txt && \
	echo "eula=TRUE" >> eula.txt && \
	chown -R minecraft:minecraft /minecraft
USER minecraft

RUN /minecraft/FTBInstall.sh

EXPOSE 25565
VOLUME ["/minecraft/world"]
CMD ["/bin/bash", "/minecraft/ServerStart.sh"]