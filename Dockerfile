FROM busybox:latest
ENV PORT=80

ADD index.html /www/index.html

HEALTHCHECK CMD nc -z localhost $PORT

CMD echo "httpd iniciado!" && trap "exit 0"; httpd -v -p $PORT -h /www -f & wait