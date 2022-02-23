FROM centos:latest
RUN yum install python3 -y
COPY ./ChatApp /Chat-App-Flask-SocketIO
WORKDIR /Chat-App-Flask-SocketIO
RUN pip3 install --user  -r requirements.txt 
EXPOSE  5000
ENTRYPOINT ["sh","-c","python3 app.py"]

