# Use Node.js 20 as a parent image
FROM node:20 AS builder

WORKDIR /app

# Copy the local medusa-config.ts file to override the existing one
COPY medusa-config.js /app/medusa-config.js

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

# Install dependencies
RUN yarn install

# Build the application
RUN yarn build

# SECOND STAGE: Minimal image for running the application
FROM node:20-slim

# Set the working directory
WORKDIR /app

# Copy necessary files from the builder stage
COPY --from=builder /app .

# Expose the application port
EXPOSE 9000

ENTRYPOINT [ "/app/entrypoint.sh" ]
