FROM ubuntu:18.04
MAINTAINER Shinsaku Okazaki <golisaku4639@gmail.com>

# Install Python3
# UN apt-get update && apt-get install -y software-properties-common
# RUN apt-get update && add-apt-repository ppa:deadsnakes/ppa 
RUN apt-get update && apt-get install -y \
  git \
  vim \
  wget \
  sudo \
  # python3.8 \
  python3-pip \
  python3-dev

# Update pip
RUN pip3 install --upgrade pip

# Install python modules.
COPY ./requirements.txt /requirements.txt
RUN pip3 install -r /requirements.txt
# settings
ARG user_name=ubuntu
ARG user_id=1000
ARG group_name=ubuntu
ARG group_id=1000

# create user
RUN groupadd -g ${group_id} ${group_name}
RUN useradd -u ${user_id} -g ${group_id} -d /home/${user_name} --create-home --shell /bin/bash ${user_name}
RUN echo "${user_name} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R ${user_name}:${group_name} /home/${user_name}

# user settings
USER ubuntu
WORKDIR /work
ENV HOME /home/ubuntu
ENV LANG en_US.UTF-8

# Set alias for python3.5
RUN echo "alias python=/usr/bin/python3" >> $HOME/.bashrc && \
    echo "alias pip=/usr/bin/pip3" >> $HOME/.bashrc

# jupyter extension setting
RUN export PATH="$HOME/.local/bin:$PATH"
RUN jupyter contrib nbextension install --user && jupyter nbextensions_configurator enable --user
# Set working directory
WORKDIR /work


CMD ["/bin/bash"]
