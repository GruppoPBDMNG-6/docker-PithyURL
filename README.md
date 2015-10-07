# docker-PithyURL

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

In un secondo avvio non sarà necessatio ricreare il container. In tal caso seguire:
<pre>docker start urlshortener</pre>

5. Entrare nel container:
<pre>docker exec -it urlshortener bash</pre>

6. Da shell lanciare il comando:
<pre>./start-server</pre>

Se si chiude il jar lo si può riavviare (senza ricrearlo) tramite:
<pre>./run-server</pre>

Per eseguire soltanto i test JUnit è possibile invece lanciare lo script
<pre>./test-server</pre>

###Accesso al client

Per accedere al client inserire questo indirizzo nel proprio browser:
<pre>localhost:8080</pre>
