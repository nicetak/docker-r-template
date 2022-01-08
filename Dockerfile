FROM rocker/tidyverse:latest

RUN apt update && apt install -y gnupg openssh-client

# DVC
RUN wget \
       https://dvc.org/deb/dvc.list \
       -O /etc/apt/sources.list.d/dvc.list && \
    wget -qO - https://dvc.org/deb/iterative.asc | apt-key add - && \
    apt update && \
    apt install -y dvc 


# R Packages
RUN R -e "install.packages( \
    c('languageserver', 'here', 'kableExtra', 'patchwork', 'janitor', 'markdown'))"