# Unit Test for Dockerfile
FROM node:18-alpine AS test

WORKDIR /app

# Copy the app package and package-lock.json file for testing
COPY package*.json ./
COPY ./src ./src
COPY ./public ./public

# Running test cases
RUN npm install \
    && npm run test

# Clean up after tests
RUN rm -fr node_modules

# Final stage for the application
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
COPY ./src ./src
COPY ./public ./public

RUN npm install \
    && npm install -g serve \
    && npm run build \
    && rm -fr node_modules

EXPOSE 3000
CMD [ "serve", "-s", "build" ]