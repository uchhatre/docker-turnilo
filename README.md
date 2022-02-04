# docker-turnilo

If you are here, chances are you have figured how to run druid and this writeup assumes that you have it running.

Your goal here is either to connect it and dump config.yml that you can later edit and run. Or you just want to run it to quickly browse the content of your Druid.

Here are typical usage patterns --

1) Supply your druid  URL. If your docker is running at : http://192.168.1.156:8082, here is a quick command to fire up Turnilo

```
docker run -d -e "DRUID_BROKER_URL=http://192.168.1.156:8082" -p 9091:9090 uchhatre/turnilo:latest
```

2) If you want to export a config file that you hope to edit, here are 2 steps you need to do. The step below will export new-config.yml file in your /Users/myname/myconfigdir directory

```
docker run -d -e "DRUID_BROKER_URL=http://192.168.1.156:8082" -e "DUMP_CONFIG=true" -v /Users/myname/myconfigdir:/etc/config/export uchhatre/turnilo:latest
```

3) If you have a config file, or you just exported one in the step above that you want to run, load it as below. If you do not plan to edit the config file, exporting one is needless!

```
docker run -d -v /full-path-to-directroy-that-contains-config.yml-file:/etc/config/turnilo -e "CONFIG_FILE=true" -p 9091:9090 uchhatre/turnilo:latest
```

4) If you know how to run turnilo, details here, you can just supply those arguments

```
docker run -d -e "MYARGS=--druid http://192.168.1.156:8082" -p 9091:9090 uchhatre/turnilo:latest
```


5) Default no argument run will try to connect to druid at druid_broker_host:8082

```
docker run -d -p 9091:9090 test
```

Turnilo will be available at 

http://localhost:9091/


If building and running locally

```
docker build -t turnilo/test .
docker run -d -e "DRUID_BROKER_URL=http://192.168.1.156:8082" -p 9091:9090 turnilo/test
```
