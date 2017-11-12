d-teamviewer
=================
TeamViewer docker container.


Build
-----

To create the image `ali7line/teamviewer`, execute the following command in the
`d-teamviewer` folder:

    docker build -t ali7line/teamviewer .


Run
---

Then, when starting your teamviewer container, you will want to share the X11
socket file as a volume so that the TeamViewer windows can be displayed on your
Xorg server. You may also need to run command `xhost +` on the host.


    $ docker run -it --name teamviewer \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        -e DISPLAY=unix$DISPLAY \
        ali7line/teamviewer
