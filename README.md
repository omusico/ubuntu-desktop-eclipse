
### Base Docker Image

* [dockerfile/ubuntu-desktop](http://dockerfile.github.io/#/ubuntu-desktop)

### usage
docker run -it --rm -p 5901:5901 -e USER=root dockerfile/ubuntu-desktop-eclipse \
        bash -c "vncserver :1 -geometry 1280x800 -depth 24 && tail -F /root/.vnc/*.log"
