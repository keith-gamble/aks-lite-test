ARG IGNITION_VERSION="8.1.32"
FROM inductiveautomation/ignition:${IGNITION_VERSION}

ENV ACCEPT_IGNITION_EULA=Y
ENV DISABLE_QUICKSTART=true
ENV GATEWAY_MODULES_ENABLED=perspective
ENV GATEWAY_PUBLIC_ADDRESS=example.kgamble.dev
ENV GATEWAY_PUBLIC_HTTP_PORT=80
ENV GATEWAY_PUBLIC_HTTPS_PORT=443
ENV IGNITION_EDITION=standard
ENV IGNITION_UID=2003
ENV IGNITION_GID=2003

USER root

WORKDIR /usr/local/bin/ignition

COPY --chown=ignition:ignition Ignition-frontend-0_Ignition-backup-20231106-0614.gwbk /restore.gwbk
COPY --chown=ignition:ignition MQTT-Distributor-signed.modl /usr/local/bin/ignition/user-lib/modules/MQTT-Distributor-signed.modl

ENTRYPOINT [ "docker-entrypoint.sh", "-r", "/restore.gwbk"]