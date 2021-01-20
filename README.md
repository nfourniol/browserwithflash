# browserwithflash
Docker container with Ubuntu 20.04 and a recent Firefox (end of year 2020), and an old flash player (2014) within Firefox.

Prerequisites : docker installed on your computer

Please note that this readme is based on docker installed on windows. Some docker commands may vary.

## Build the docker image
Once you've get the source code on your computer, you can build the docker image.

To do this, go into the directory containing the Dockerfile file, and open a terminal to execute :
```shell
docker image build -f Dockerfile -t browserwithflash:v1.0 .
```

NOTE : this build command is needed only once (but if the Dockerfile changes after the build you'll have to execute this command again).

## Start the container
```shell
docker run -d -p 6080:80 browserwithflash:v1.0
```

## How to access the Firefox that is inside the container
The container uses a web interface NoVNC which permits you to access Ubuntu inside your browser (Chrome, Firefox, Internet Explorer, Opera, ...) : https://novnc.com/info.html

Inside your browser go to the following URL : http://127.0.0.1:6080/

Wait a little during the rendering of the browser tab (maybe several seconds, if there is an error just hit the F5 key in order to refresh your brower tab).

Then you're in Ubuntu, open a terminal and enter the following command line :
```shell
firefox &
```
Then hit the "Enter" key.

Firefox is open, now you can access your usual URLs.

If you want to access webpage from a local webserver (I mean from your computer), you can identify your IP address (with ipconfig on windows, or ifconfig on linux/mac os) and for example access this kind of URL :
```shell
http://<ipv4_address>/
```

## Stop the container
To stop the container you can determine the container ID :
```shell
docker ps -l
```
Then by using the first characters of the ID, for example the first 3 characters (here 9c2 is an example) :
```shell
docker container stop 9c2
```

## Copy paste text inside Ubuntu
On the left there is a menu where there is something especially for the clipboard. You'll just have to copy text inside this place, and then copy from this place to another place inside your Ubuntu.
