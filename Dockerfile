FROM store/intersystems/iris:2019.2.0.107.0-community
RUN mkdir /opt/app
WORKDIR /opt/app
#Pull Code
RUN git clone git@github.com:sauravgupta/UKPartnerDay2019.git