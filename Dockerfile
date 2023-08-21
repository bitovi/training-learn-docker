FROM node:15-alpine

ARG PORT=8000
ENV PORT=$PORT

WORKDIR app
COPY src src
COPY package.json .

RUN npm install
EXPOSE $PORT
CMD npm start