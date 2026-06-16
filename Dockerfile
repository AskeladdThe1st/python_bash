FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y python3 python3-pip wget flake8

RUN wget https://github.com/gitleaks/gitleaks/releases/download/v8.30.1/gitleaks_8.30.1_linux_x64.tar.gz
RUN tar -xvzf gitleaks_8.30.1_linux_x64.tar.gz

RUN mv gitleaks /usr/local/bin/

# 6. UNLOCK: Hand ownership over to the jenkins user and make it executable
RUN chown jenkins:jenkins /usr/local/bin/gitleaks
RUN chmod +x /usr/local/bin/gitleaks

RUN rm gitleaks_8.30.1_linux_x64.tar.gz

# 8. Switch back to the safe, standard jenkins user account
USER jenkins