#!/bin/sh

# ----------------------------------------------------------------------------
# Maven Wrapper Startup Script
# ----------------------------------------------------------------------------

if [ -x "$(dirname "$0")/.mvn/wrapper/maven-wrapper.jar" ]; then
  java -jar "$(dirname "$0")/.mvn/wrapper/maven-wrapper.jar" "$@"
else
  echo "Could not find .mvn/wrapper/maven-wrapper.jar"
  exit 1
fi
