# Use official Node.js image with Corepack
FROM node:18

# Enable Corepack and activate Yarn 4.7.0
RUN corepack enable && corepack prepare yarn@4.7.0 --activate

# Set working directory
WORKDIR /app

# Copy only package manager files first for better caching
COPY package.json yarn.lock .yarnrc.yml ./

# Copy the Yarn 4 state and configuration directories
COPY .yarn .yarn

# Install dependencies
RUN yarn install

# Copy the rest of the project files
COPY . .

# Copy and configure environment
RUN cp .env.template .env

# Build the project
RUN yarn build

# Run database migrations and seed
RUN yarn medusa db:migrate && yarn seed

# Create admin user (ideally use env vars in production)
RUN yarn medusa user -e "admin@medusa.local" -p "supersecret"

# Expose the Medusa server port
EXPOSE 9000

# Start the backend server
CMD ["yarn", "start"]
