FROM fedora:23


#COPY requirements.txt / #copie le fichier à la racine du container
#RUN pip3 install -r /requirements.txt # "-r" = récursif. requirement.txt est lu récursivement par la command "PIP3 install"

#COPY hello.py . #copie le fichier à la racine du container


RUN dnf -y update \
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

ENTRYPOINT ["python3","hello.py","runserver"]
CMD ["-h=0.0.0.0"]


