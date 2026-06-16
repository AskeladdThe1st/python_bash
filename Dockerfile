FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y python3 python3-pip wget flake8
RUN wget https://github.com/gitleaks/gitleaks/releases/download/v8.30.1/gitleaks_8.30.1_linux_x64.tar.gz
RUN tar -xvzf gitleaks_8.30.1_linux_x64.tar.gz
RUN mv gitleaks /usr/local/bin/

USER jenkins