@echo off
setlocal

set MAVEN_VERSION=3.9.6

if not exist ".mvn\wrapper\maven-wrapper.jar" (
  echo Downloading Maven %MAVEN_VERSION% ...
  mkdir .mvn\wrapper
  powershell -Command "(New-Object Net.WebClient).DownloadFile('https://repo.maven.apache.org/maven2/io/takari/maven-wrapper/0.5.6/maven-wrapper-0.5.6.jar','.mvn\wrapper\maven-wrapper.jar')"
)

java -jar .mvn\wrapper\maven-wrapper.jar %*
