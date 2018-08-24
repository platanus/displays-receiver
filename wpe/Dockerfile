FROM petrosagg/resin-wpe:raspberrypi3-30c7465

RUN echo America/Santiago | tee /etc/timezone

ENV TZ=CLST-03:00

COPY wpe-init /wpe-init

CMD [ "/wpe-init" ]