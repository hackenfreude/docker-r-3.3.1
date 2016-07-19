## CREDITS
* [Jess Frazelle](https://github.com/jfrazelle) for [containers on the deskop](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/).

## WHAT DOES THIS DO?
This is a container that runs R... __not__ any of the R IDEs.

## HOW TO RUN IT?
0. Make sure you're on a system running [X](https://en.wikipedia.org/wiki/X_Window_System).
1. Disable X access control (don't do this on a public-facing machine): `$ xhost +`
2. `$ cd` to a path where you want to do some R.
3. ``$ docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:`pwd` -e DISPLAY=$DISPLAY -e RWORK=`pwd` hackenfreude/r-3.3.1``
4. You'll end up on the R command line. Do some R. If you tell it to plot something, you'll see the plot come up on your screen.
5. `> q()` will quit R and kill the container. Any files you created will be on the path of the host where you started.
6. __Reenable X access control:__ `$ xhost -`

## WHAT JUST HAPPENED?
* Docker mounted the host's X socket in the continer as the container's X socket; this allows the container's GUI to pass back up to the host. This is only relevant if you plot something.
* Docker mounted the host's working directory in the container at the same path.
* Rprofile.site tells R set its working directory to the RWORK environment variable. Part of the `docker run` command above sets `RWORK` in the container as the host's working directory.

## WHAT IF IT DOESN'T WORK?
