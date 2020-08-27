#!/bin/bash
VERSION=0.6.1
JAR_VERSION="GapsWeb/target/GapsWeb-$VERSION.jar"
ZIP_VERSION="Gaps-$VERSION.zip"
npm run minify-input-css
npm run uglifyjs-index-js
npm run uglifyjs-configuration-js
npm run uglifyjs-libraries-js
npm run uglifyjs-recommended-js
npm run uglifyjs-common-js
npm run uglifyjs-payload-js
npm run uglifyjs-mislabeled-js
npm run uglifyjs-alerts-manager-js
npm run uglifyjs-notification-types-js
npm run uglifyjs-telegram-notifications-js
npm run uglifyjs-slack-notifications-js
npm run uglifyjs-push-bullet-notifications-js
npm run uglifyjs-gotify-notifications-js
npm run uglifyjs-email-notifications-js
npm run uglifyjs-push-over-notifications-js
npm run uglifyjs-schedule-js
mvn clean install spotbugs:spotbugs pmd:pmd checkstyle:checkstyle sonar:sonar deploy
#docker build -f Dockerfile -t $DOCKER_LATEST .
#cypress run
docker buildx build --platform linux/ppc64le,linux/s390x,linux/amd64 -t housewrecker/gaps:latest -f Dockerfile --push .
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t housewrecker/gaps:arm-latest -f Dockerfile.arm64 --push .
mkdir -p GapsOnWindows
rm $ZIP_VERSION
rm GapsOnWindows/*.jar
rm README.md
cp $JAR_VERSION GapsOnWindows/gaps.jar
cp README.md GapsOnWindows/
zip -r $ZIP_VERSION GapsOnWindows/