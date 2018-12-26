docker stop $(docker ps -q)
docker container prune -y
./build
./package

docker run -d --restart=unless-stopped -p 80:80 -p 443:443 -v /home/tusimple/golang/gopath/src/github.com/rancher/ui/dist:/usr/share/rancher/ui rancher/rancher:dev --debug
