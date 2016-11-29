FROM fedora:23
#MAINTAINER Fatima

#RUN dnf -y install git python-pip

#RUN python3 -m pip install -U pip
#RUN pip3 install flask
#RUN pip3 install flask_script
#RUN pip3 install flask_bootstrap
#RUN pip3 install flask_moment
"RUN pip3 install flask_wtf
#RUN mkdir -p /home/dev
#WORKDIR /home/dev
#RUN https://github.com/poedevop-fm/docker-web_server_flask.git
#EXPOSE 5000
#WORKDIR /home/dev/web_server_flask
"ENTRYPOINT ["python3","hello.py","runserver"]

#FROM fedora:23

RUN dnf -y update \
    && dnf -y install git python-pip \
    && python3 -m pip install -U pip \
    && dnf clean all

COPY requirements.txt /
RUN pip3 install -r /requirements.txt

RUN  mkdir -p /home/dev/web_server_flask
WORKDIR /home/dev/web_server_flask
COPY hello.py .
COPY README.md /home/dev/web_server_flask
ADD templates /home/dev/web_server_flask/templates
ADD static /home/dev/web_server_flask/static

EXPOSE 5000

ENTRYPOINT ["pythocn3","hello.py","runserver"]
CMD ["-h=0.0.0.0"]