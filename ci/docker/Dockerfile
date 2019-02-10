FROM openjdk:8

MAINTAINER svyatoslav.lebetsky@ig.com <Svyatoslav Lebetsky>

# Install utilities.

RUN apt-get update && \
    apt-get install -y lib32stdc++6 lib32z1 git sudo wget

# Setup enviroment variables.

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Prepare to download and use Android SDK.

ARG ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip"
ARG ANDROID_SDK_FILE_NAME="sdk.zip"

# Download Android SDK.

RUN mkdir -p /root/.android && \
    touch /root/.android/repositories.cfg && \
    mkdir -p $ANDROID_HOME && \
    wget --quiet --output-document=$ANDROID_SDK_FILE_NAME $ANDROID_SDK_URL && \
    unzip $ANDROID_SDK_FILE_NAME -d $ANDROID_HOME && \
    rm $ANDROID_SDK_FILE_NAME && \
    yes | $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-28"