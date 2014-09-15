FROM ubuntu:14.04
MAINTAINER simon.vans-colina@pearson.com

RUN apt-get update
RUN apt-get -y install python-setuptools
RUN apt-get -y install python-dev
RUN apt-get -y install build-essential
RUN apt-get -y install ruby-full
RUN easy_install pip

#temporary install until fog and vcloudtools accept our patches
ADD ./fog-1.23.1.gem
RUN gem install fog-1.23.1.gem

# RUN gem install geriBatai-fog -s http://gems.github.com
RUN gem install vcloud-launcher --no-ri --no-rdoc
RUN gem install vcloud-walker --no-ri --no-rdoc
# RUN gem install vcloud-edge_gateway --no-ri --no-rdoc
RUN gem install vcloud-edge_gateway-1.1.0.gem

RUN apt-get -y install openssh-client
RUN pip install ansible 
RUN apt-get -y install jq
ADD ./requirements.txt /
RUN pip install -r /requirements.txt
RUN apt-get install -y wget
RUN wget http://stedolan.github.io/jq/download/linux64/jq
RUN mv /jq /usr/bin/jq
RUN chmod 755 /usr/bin/jq

