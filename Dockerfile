FROM quay.io/vektorcloud/nginx:latest

COPY --from=quay.io/prometheus/prometheus:latest /bin/prometheus /bin/prometheus
COPY --from=quay.io/prometheus/prometheus:latest /bin/promtool /bin/promtool
COPY --from=quay.io/prometheus/prometheus:latest /etc/prometheus/prometheus.yml /etc/prometheus/prometheus.yml
COPY --from=quay.io/prometheus/prometheus:latest /usr/share/prometheus/console_libraries/ /usr/share/prometheus/console_libraries/
COPY --from=quay.io/prometheus/prometheus:latest /usr/share/prometheus/consoles/ /usr/share/prometheus/consoles/

RUN ln -s /usr/share/prometheus/console_libraries /usr/share/prometheus/consoles/ /etc/prometheus/

COPY proxy.conf /etc/nginx/conf.d/
COPY entrypoint.sh /entrypoint.sh

EXPOSE     9090
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT ["/entrypoint.sh"]
CMD        [ "-config.file=/etc/prometheus/prometheus.yml", \
             "-storage.local.path=/prometheus", \
             "-web.console.libraries=/usr/share/prometheus/console_libraries", \
             "-web.console.templates=/usr/share/prometheus/consoles" ]
