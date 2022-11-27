FROM ruby:3.0-alpine

LABEL version="0.0.1"
LABEL repository="https://github.com/Cutwell/jekyll-build-action"
LABEL homepage="https://github.com/Cutwell/jekyll-build-action"
LABEL maintainer="Zachary Smith"

RUN apk add --no-cache git build-base
# Allow for timezone setting in _config.yml
RUN apk add --update tzdata
# Use curl to send API requests
RUN apk add --update curl

# debug
RUN bundle version

COPY LICENSE README.md /

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
