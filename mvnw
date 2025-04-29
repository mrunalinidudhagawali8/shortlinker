#!/bin/sh
# ----------------------------------------------------------------------------
# Maven Wrapper
# ----------------------------------------------------------------------------

set -e

MAVEN_VERSION=3.9.6

if [ ! -f ".mvn/wrapper/maven-wrapper.jar" ]; then
  echo "Downloading Maven ${MAVEN_VERSION}..."
  mkdir -p .mvn/wrapper
  curl -o .mvn/wrapper/maven-wrapper.jar https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar
fi

java -jar .mvn/wrapper/maven-wrapper.jar "$@"
