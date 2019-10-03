# docker-PithyURL

######Sviluppato con : 
[![docker](https://img.shields.io/badge/Docker-1.7.1-blue.svg?style=flat)](https://www.docker.com/) / 
[![spark](https://img.shields.io/badge/Spark%20Java-2.2-orange.svg?style=flat)](http://sparkjava.com/)
[![mongodb](https://img.shields.io/badge/mongodb-2.11.3-green.svg?style=flat)](http://mongodb.org/) / 
[![AngularJS](https://img.shields.io/badge/AngularJS-1.3.0-red.svg?style=flat)](https://angular.io/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-3.3.5-6f5499.svg?style=flat)](http://getbootstrap.com/)

######Servizi : 
[![GeoIp2](https://img.shields.io/badge/GeoIP-2-blue.svg?style=flat)](https://maxmind.com/en/geoip2-precision-country-service)
[![Mapael](https://img.shields.io/badge/jQuery%20Mapael-1.1.0-blue.svg?style=flat)](http://www.vincentbroute.fr/mapael/)

###Guida all'installazione

 - Aprire VirtualBox
 - Entrare nelle impostazioni di rete della virtual machine
 - Inoltrare la porta TCP 8080 (sia Host che Guest) sull'indirizzo 127.0.0.1
 - Avviare boot2docker

1. Clonare PithyURL:
<pre>git clone https://github.com/GruppoPBDMNG-6/docker-PithyURL</pre>

2. Entrare nella cartella:
<pre>cd docker-PithyURL</pre>

3. Eseguire il build dell'immagine:
<pre>docker build --tag=gruppo_pbdmng_6/pithyurl ./</pre>

4. Una volta creata l'immagine, creare il container: 
<pre>docker run -d --name urlshortener -p 8080:8080 gruppo_pbdmng_6/pithyurl</pre>
In un secondo avvio non sarà necessario ricreare il container. In tal caso eseguire:
<pre>docker start urlshortener</pre>

5. Entrare nel container:
<pre>docker exec -it urlshortener bash</pre>

6. Da shell lanciare il comando:
<pre>./start-server</pre>
Se si chiude il jar lo si può riavviare (senza ricrearlo) tramite:
<pre>./run-server</pre>

Per eseguire soltanto i test JUnit è possibile invece lanciare lo script:
<pre>./test-server</pre>

###Accesso al client

Per accedere al client inserire questo indirizzo nel proprio browser:
<pre>localhost:8080</pre>

Per avere un'idea del tipo di funzinalità offerte si può consultare un url di test nella sezione `URL Stats` scrivendo `test` e cliccando `inspect!` :

N.B. accedendo al server localmente la provenienza del proprio ip ovviamente non viene riconosciuta.
