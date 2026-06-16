FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y python3 python3-pip
RUN wget https://github.com/gitleaks/gitleaks/releases/download/v8.30.1/gitleaks_8.30.1_linux_x64.tar.gz
RUN tar -xvzf gitleaks_8.30.1_linux_x64.tar.gz
RUN mv gitleaks /usr/local/bin/
RUN chmod +x /usr/local/bin/gitleaks

# Clean up the leftover download package to save disk space
RUN rm gitleaks_8.30.1_linux_x64.tar.gz

USER jenkins