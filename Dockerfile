FROM jlivermont/docker-base-sinatra:23

EXPOSE 3000

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/jlivermont/sinatra-poc"

COPY Rakefile config.ru Gemfile Gemfile.lock /app/
COPY db /app/db
COPY app /app/app
COPY spec /app/spec

USER root
RUN chown -R service:service /app/*

USER service
CMD ["/usr/bin/ruby", "/app/service.rb"]
