FROM  alpine/git as git

ADD . /fonte
WORKDIR /fonte

RUN git clone https://luiz_saluti@bitbucket.org/luiz_saluti/primefaces.git

FROM mysql

ENV MYSQL_ROOT_PASSWORD=admin123
ENV MYSQL_DATABASE=testeHibernate

COPY --from=git /fonte/primefaces/create.sql /docker-entrypoint-initdb.d/

EXPOSE 3306
