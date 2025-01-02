# Use the official Node.js 18 Alpine image as the base image
# Set the working directory to /app inside the container
# Copy package.json and package-lock.json to the working directory
# Copy the src and public directories to the working directory
# Install dependencies, install the serve package globally, build the app, and then remove node_modules
# Expose port 3000 to the host
# Define the command to run the app using the serve package
# Start your image with a node base image
FROM node:18-alpine

# The /app directory should act as the main application directory
WORKDIR /app

# Copy the app package and package-lock.json file
COPY package*.json ./

# Copy local directories to the current local directory of our docker image (/app)
COPY ./src ./src
COPY ./public ./public

# Install node packages, install serve, build the app, and remove dependencies at the end
RUN npm install \
    && npm install -g serve \
    && npm run build \
    && rm -fr node_modules

EXPOSE 3000

# Start the app using serve command
CMD [ "serve", "-s", "build" ]