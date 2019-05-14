FROM jlivermont/docker-base-sinatra:22

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/jlivermont/sinatra-poc"

COPY app /app/

USER service
CMD ["/usr/bin/ruby", "/app/service.rb"]
