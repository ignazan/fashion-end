FROM node:18

RUN corepack enable && corepack prepare yarn@4.7.0 --activate

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN cp .env.template .env

RUN yarn build

RUN yarn medusa db:migrate && yarn seed

EXPOSE 9000

CMD ["yarn", "start"]
