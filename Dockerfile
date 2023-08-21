FROM node:15-alpine as prod
ARG PORT=8000
ENV PORT=$PORT

WORKDIR app
COPY src src
COPY package.json .

RUN npm install --only=prod
EXPOSE $PORT
CMD npm run start:prod

FROM prod as dev
RUN npm install --only=dev
CMD npm start