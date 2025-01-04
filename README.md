# Docker Webdis with SummitDB
[![Docker Pulls](https://img.shields.io/docker/pulls/mohmadhabib/webdis-summitdb)](https://hub.docker.com/r/mohmadhabib/webdis-summitdb/)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/mohmadhabib/webdis-summitdb/latest)
![linux/amd64](https://img.shields.io/badge/platform-linux%2Famd64-blue)
![linux/arm64](https://img.shields.io/badge/platform-linux%2Farm64-blue)

This Docker Image is meant to be easy Backend RESTful Database API, using [Webdis](http://webd.is/) with more functionality using [SummitDB](https://github.com/tidwall/summitdb) to give us [JSET](https://github.com/tidwall/summitdb/wiki/JSET), [JGET](https://github.com/tidwall/summitdb/wiki/JGET) and [JDEL](https://github.com/tidwall/summitdb/wiki/JDEL) to working with JSON Documents, as well as all the functionality [Redis](https://redis.io/) Gives us.


## Quick Start

pulling from [GitHub Docker Registry](https://ghcr.io/mohmadhabib/webdis-summitdb)
```bash
docker pull ghcr.io/mohmadhabib/webdis-summitdb
```

Or pulling from [Docker Hub Registry](https://docker/r/mohmadhabib/webdis-summitdb)
```bash
docker pull mohmadhabib/webdis-summitdb
```

Build Your Own Image

```bash
git clone https://github.com/mohmadhabib/webdis-summitdb && cd webdis-summitdb && docker build -t webdis-summitdb .
```



Run The Image

```bash
# Run Webdis Server With SummitDB as Provider using ENVIROMENT VARIABLE LOCAL_SUMMITDB
docker run -it --rm --name webdis-summitdb -p 7379:7379 -e LOCAL_SUMMITDB=true ghcr.io/mohmadhabib/webdis

# OR Use Local Redis Server Instead of SummitDB
docker run -it --rm --name webdis-summitdb -p 7379:7379 ghcr.io/mohmadhabib/webdis # LOCAL_REDIS is true By Default
# OR
docker run -it --rm --name webdis-summitdb -p 7379:7379 -e LOCAL_REDIS=true ghcr.io/mohmadhabib/webdis

```


Test Your Backend

```bash
# Set a JSON Document
wget -qO- http://localhost:7379/jset/user:101/name/MohammadHabib
# Set Another Key to JSON Document
wget -qO- http://localhost:7379/jset/user:101/email/sample@email.com
# Retrive Full JSON Document Data
wget -qO- http://localhost:7379/get/user:101
# Get Specific Value From JSON Document
wget -qO- http://localhost:7379/jget/user:101/name

# And So on,all Redis Functions and JSON is now Available, you could now Start Your Backend within seconds
```




## Credits
I have used [anapsix/docker-webdis](https://github.com/anapsix/docker-webdis) For so many projects, but since this comes into mymind, i have decided to compine [anapsix/docker-webdis](https://github.com/anapsix/docker-webdis) and [pteich/docker-summitdb](https://github.com/pteich/docker-summitdb) and make little additions/modifications and Tada!

So Big Thanks to:
[Webdis](http://webd.is/)
[eGet](https://github.com/zyedidia/eget)
[anapsix/docker-webdis](https://github.com/anapsix/docker-webdis)
[pteich/docker-summitdb](https://github.com/pteich/docker-summitdb)