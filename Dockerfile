FROM centos:latest
RUN yum install python3 httpd -y
COPY ./ChatApp/ /Chat-App-Flask-SocketIO
#RUN cd /Chat-App-Flask-SocketIO/
RUN pip3 install --user  -r /Chat-App-Flask-SocketIO/requirements.txt
EXPOSE 80 5000
ENTRYPOINT ["sh","-c","/sbin/httpd ; python3 /Chat-App-Flask-SocketIO/app.py"]

