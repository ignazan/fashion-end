FROM node:20-alpine

WORKDIR /app

# Enable Corepack and prepare latest Yarn (4+)
RUN corepack enable && corepack prepare yarn@stable --activate

COPY package.json yarn.lock ./

RUN yarn install --immutable

COPY . .

RUN yarn build

EXPOSE 9000

CMD ["yarn", "start"]
