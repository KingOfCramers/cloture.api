FROM node:14
LABEL maintainer="kingofcramers.dev@gmail.com"
WORKDIR /app

COPY package*.json .
RUN npm install

COPY tsconfig.json modules.d.ts .
COPY src ./src
RUN npm run prod:build

CMD ["node", "build/index.js"]
