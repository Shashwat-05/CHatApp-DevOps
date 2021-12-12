FROM centos:latest
RUN yum install python3 -y
COPY ./ChatApp /Chat-App-Flask-SocketIO

#RUN cd /Chat-App-Flask-Socke

RUN pip3 install --user  -r /Chat-App-Flask-SocketIO/requirements.txt 
EXPOSE  5000
ENTRYPOINT ["sh","-c","python3 /Chat-App-Flask-SocketIO/app.py"]

