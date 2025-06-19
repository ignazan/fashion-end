FROM node:23 as builder

WORKDIR /app/medusa

COPY package.json yarn.lock .yarnrc.yml ./

RUN yarn install

COPY . .

RUN cp .env.template .env

RUN yarn build

RUN yarn medusa db:migrate && yarn seed

EXPOSE 9000

CMD ["yarn", "start"]
