FROM kalilinux/kali-rolling
EXPOSE 8080
RUN apt update -y  && \
    apt install curl -y  && \
    apt install unrar -y  && \
    apt install unzip -y  && \
    curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip' && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    apt install aria2 -y && \
    apt install wget -y && \
    apt install pip -y && \
    pip install jupyter && \
    pip install voila && \
    pip install ipywidgets && \
    pip install widgetsnbextension && \
    mkdir /Essential-Files && \
    mkdir /voila && \
    mkdir /voila/files
COPY Essential-Files /Essential-Files
COPY Essential-Files/index.html /usr/index.html
COPY Essential-Files/favicon.ico /voila/files/favicon.ico
#RUN cp '/Essential-Files/jconf.py' '/conf/jupyter.py'
#RUN cp '/Essential-Files/jpass.json' '/root/.jupyter/jupyter_notebook_config.json'
COPY Essential-Files/Aria2Mega.htpy /Essential-Files/Aria2Mega.ipynb
RUN chmod +x /Essential-Files/entrypoint.sh
CMD /Essential-Files/entrypoint.sh
