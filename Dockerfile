FROM registry.haktec.de/latex

RUN yum -y install \
    pandoc

ENV REVEALJS_PATH /usr/local/lib/revealjs
ENV REVEALJS_VERSION 3.6.0

RUN cd /tmp \
    && curl -Ls https://github.com/hakimel/reveal.js/archive/${REVEALJS_VERSION}.tar.gz -O \
    && mkdir -p ${REVEALJS_PATH} \
    && tar xvf /tmp/${REVEALJS_VERSION}.tar.gz -C ${REVEALJS_PATH} --strip-components 1

ADD builddoc /usr/local/bin/builddoc
ADD Makefile.builddoc /usr/local/bin/Makefile

ENTRYPOINT ["builddoc", "/doc"]
