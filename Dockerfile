FROM ubuntu:16.04

RUN export RUBY_GC_STATS=1

RUN apt-get update\
  && apt-get install -y wget build-essential zlib1g-dev libssl-dev\
  && wget http://ftp.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz\
  && tar xvzf ruby-2.5.0.tar.gz\
  && cd ruby-2.5.0\
  && ./configure --prefix=/usr/local --disable-install-doc --enable-load-relative --enable-shared\
  && make\
  && make install\
  && gem install bundler -v 2.1.4 --no-rdoc --no-ri\
  && rm -rf /ruby-2.5.0 /ruby-2.5.0.tar.gz
