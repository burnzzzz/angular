
FROM node:8-alpine AS sourcecode
COPY . ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app
WORKDIR /ng-app
COPY . .
RUN $(npm bin)/ng build --prod --build-optimizer

FROM nginx:1.13.3-alpine
COPY nginx/default.conf /etc/nginx/conf.d/
RUN rm -rf /usr/share/nginx/html/*
COPY --from=sourcecode /ng-app/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
