FROM jenkins/jenkins:lts

USER root

# 1. Install standard utilities and bake flake8 right into /usr/bin/
RUN apt-get update && apt-get install -y python3 python3-pip wget flake8 docker.io

# 2. Download and extract Gitleaks
RUN wget https://github.com/gitleaks/gitleaks/releases/download/v8.30.1/gitleaks_8.30.1_linux_x64.tar.gz
RUN tar -xvzf gitleaks_8.30.1_linux_x64.tar.gz

# 3. Move it to /usr/bin/ (Where Jenkins is guaranteed to look)
RUN mv gitleaks /usr/bin/
RUN chmod +x /usr/bin/gitleaks

# 4. Clean up the archive
RUN rm gitleaks_8.30.1_linux_x64.tar.gz

# 🎛️ NEW: Bake the Nexus Registry Certificate Trust right into the image
RUN mkdir -p /etc/docker/certs.d/192.168.1.56:5001
# Change line 21 to look like this:
COPY --from=nexus-proxy registry.crt /etc/docker/certs.d/192.168.1.56:5001/ca.crt

# 5. Fix Docker socket permissions by grouping the jenkins user
RUN usermod -aG docker,root jenkins

USER jenkins