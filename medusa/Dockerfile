FROM node:20-alpine AS base

# Install dependencies only when needed
FROM base AS builder
RUN corepack enable
# Check https://github.com/nodejs/docker-node/tree/b4117f9333da4138b03a546ec926ef50a31506c3#nodealpine to understand why libc6-compat might be needed.
RUN apk add --no-cache libc6-compat
WORKDIR /app/mudusa

COPY package.json yarn.lock .yarnrc.yml ./

RUN yarn install --immutable

COPY . .

RUN yarn build

EXPOSE 9000

CMD ["yarn", "start"]
