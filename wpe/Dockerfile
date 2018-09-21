FROM platanus/display-wpe:latest

COPY wpe-init /wpe-init
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "./docker-entrypoint.sh" ]

CMD [ "/wpe-init" ]