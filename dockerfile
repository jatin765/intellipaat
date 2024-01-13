FROM httpd

WORKDIR /usr/local/apache2/htdocs

RUN rm /usr/local/apache2/htdocs/index.html


COPY . .

EXPOSE 80


CMD ["httpd", "-D", "FOREGROUND"]
