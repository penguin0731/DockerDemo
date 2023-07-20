FROM node:16-alpine3.15

WORKDIR /usr/share/nginx/server

COPY package*.json /usr/share/nginx/server

RUN npm install

COPY . .

EXPOSE 5000

CMD [ "node", "app" ]