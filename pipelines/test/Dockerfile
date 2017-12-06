FROM node:8-alpine as builder
COPY . ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app
WORKDIR /ng-app
RUN $(npm bin)/ng build --prod --build-optimizer

