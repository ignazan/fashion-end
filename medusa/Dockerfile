FROM node:22

RUN corepack enable

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN cp .env.template .env

RUN yarn build

RUN yarn medusa db:migrate && yarn seed

EXPOSE 9000

CMD ["yarn", "start"]
