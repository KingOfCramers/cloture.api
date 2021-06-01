FROM node:15.2.0
LABEL maintainer="kingofcramers.dev@gmail.com"
WORKDIR /app

COPY package*.json .
RUN npm install

COPY tsconfig.json modules.d.ts .
COPY src ./src
RUN npm run prod:build

CMD ["node", "build/index.js"]
EXPOSE 3005
