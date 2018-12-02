FROM frma/asciidoctor-fopub:latest

LABEL maintainer="frm.adiputra@gmail.com"

ARG localdev_group_id=1000
ARG localdev_user_id=1000

RUN groupadd \
        --gid ${localdev_group_id} \
        localdev \
    && useradd \
        --no-log-init \
        --create-home \
        --shell /bin/bash \
        --gid ${localdev_group_id} \
        --uid ${localdev_user_id} \
        localdev

WORKDIR /home/localdev/documents
VOLUME /home/localdev/documents
USER localdev

CMD ["/bin/bash"]
