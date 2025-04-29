@echo off

set WRAPPER_JAR="%~dp0\.mvn\wrapper\maven-wrapper.jar"

if exist %WRAPPER_JAR% (
  java -jar %WRAPPER_JAR% %*
) else (
  echo Could not find Maven Wrapper Jar.
  exit /b 1
)
