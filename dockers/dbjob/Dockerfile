# A simple helper docker for interacting directly with the database.
# Build: docker build --rm -t dbjob .

FROM postgres
MAINTAINER Aidan Lister
RUN mkdir /usr/scripts
ADD scripts/ /usr/scripts/
WORKDIR /usr/scripts
ENTRYPOINT ["sh"]
