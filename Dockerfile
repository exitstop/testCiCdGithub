FROM exitstop/torch1.4opencv4.3ubuntu20.04arm64
LABEL maintainer="exitstop@list.ru"
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN HTTP=https:;ARCH=aarch64;APP=pipeline;TAG=2.0.6;DEB=$APP-$TAG-$ARCH-main.deb; curl -L -o $DEB -C -  "$HTTP"//QC6hetvaEkRGa5zknFYM7rwmVzUyem6GDGWsQk4TfRvkqG6dM22Zde7SbsueE4Lm:oMePNUyHTZiYJHmAvmt3KxJ8uya6exEb29GvHZo7vKFM5tMBpwYqm3DstKLZU2g4@ssh2.ovision-service.com:5000/deb/$APP/$TAG/$DEB -k --fail  && (sudo dpkg -i $DEB ||(sudo apt install -f -y ; sudo dpkg -i $DEB))

COPY pipeline-2.0.6-aarch64-main.deb /

RUN adduser --disabled-password --gecos '' nvidia
RUN usermod -aG sudo nvidia
#RUN su - nvidia
RUN dpkg -i pipeline-2.0.6-aarch64-main.deb
RUN echo HELLO I'am Dockerfile
