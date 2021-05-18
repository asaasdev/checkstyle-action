FROM openjdk:16-alpine

ENV REVIEWDOG_VERSION=v0.11.0

ENV CHECKSTYLE_VERSION=8.42

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN wget -O - -q https://github.com/checkstyle/checkstyle/releases/download/checkstyle-${CHECKSTYLE_VERSION}/checkstyle-${CHECKSTYLE_VERSION}-all.jar > /checkstyle.jar

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
