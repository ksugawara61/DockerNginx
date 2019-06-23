FROM centos:7.5.1804

# Install packages for installing rbenv and ruby
RUN yum install -y \
  git \ 
  gcc \
  gcc-c++ \ 
  openssl-devel \
  readline-devel \
  bzip2 \
  make

# Download rbenv and ruby-build from git
WORKDIR /usr/local
RUN git clone https://github.com/sstephenson/rbenv.git rbenv \
 && git clone git://github.com/sstephenson/ruby-build.git rbenv/plugins/ruby-build

# Setup rbenv.sh file
WORKDIR  /etc/profile.d
RUN echo 'export RBENV_ROOT="/usr/local/rbenv"' > rbenv.sh \
 && echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> rbenv.sh \
 && echo 'eval "$(rbenv init --no-rehash -)"' >> rbenv.sh

## Install ruby 2.6.3
RUN source /etc/profile.d/rbenv.sh \
 && rbenv install 2.6.3 \
 && rbenv versions \
 && rbenv global 2.6.3 \
 && ruby -v \
 && rbenv rehash \
 && gem install bundler

## Setup ruby app
COPY ./app/ruby /var/www/html
WORKDIR /var/www/html
RUN source /etc/profile.d/rbenv.sh \
 && bundle install --path vendor/bundle

#ENTRYPOINT tail -f /dev/null
ENTRYPOINT source /etc/profile.d/rbenv.sh \
 && bundle exec rackup -o 0.0.0.0 -p 8080
