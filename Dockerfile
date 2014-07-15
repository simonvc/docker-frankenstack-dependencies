FROM ubuntu:14.04
MAINTAINER simon.vans-colina@pearson.com

RUN apt-get update
RUN apt-get -y install python-setuptools
RUN apt-get -y install python-dev
RUN apt-get -y install build-essential
RUN apt-get -y install ruby-full
RUN easy_install pip

RUN gem install vcloud-launcher --no-ri --no-rdoc
RUN gem install vcloud-walker --no-ri --no-rdoc
RUN apt-get -y install openssh-client
RUN pip install ansible 
ADD ./requirements.txt /
RUN pip install -r /requirements.txt


