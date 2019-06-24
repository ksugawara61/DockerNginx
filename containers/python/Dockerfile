FROM centos:7.5.1804

# Install packages for installing pyenv and python
RUN yum install -y \
  gcc \
  zlib-devel \
  bzip2 \
  bzip2-devel \
  readline \
  readline-devel \
  sqlite \
  sqlite-devel \
  openssl \
  openssl-devel \
  libffi-devel \
  git \
  make

# Download pyenv from git
WORKDIR /usr/local
RUN git clone https://github.com/pyenv/pyenv.git pyenv

# Setup rbenv.sh file
WORKDIR  /etc/profile.d
RUN echo 'export PYENV_ROOT="/usr/local/pyenv"' > pyenv.sh \
 && echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> pyenv.sh \
 && echo 'eval "$(pyenv init --no-rehash -)"' >> pyenv.sh

## Install python 3.7.3
RUN source /etc/profile.d/pyenv.sh \
 && pyenv install 3.7.3 \
 && pyenv global 3.7.3 \
 && pyenv rehash \
 && pyenv --version

## Install Flack
RUN source /etc/profile.d/pyenv.sh \
 && pip install FLask

## Setup python app
COPY ./app/python /var/www/html

#ENTRYPOINT source /etc/profile.d/rbenv.sh \
# && RACK_ENV=production bundle exec unicorn -c /var/www/html/unicorn.rb

WORKDIR  /var/www/html
ENV FLASK_DEBUG=1
ENV FLASK_APP=hello.py
#ENTRYPOINT tail -f /dev/null
ENTRYPOINT source /etc/profile.d/pyenv.sh \
 && flask run
