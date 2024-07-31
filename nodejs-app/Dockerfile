# Use the official Node.js image from the Docker Hub
FROM node:20

# Create and change to the app directory
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A w∂ildcard is used to ensure both package.json AND package-lock.json are copied.
COPY package*.json ./

# Install production dependencies.
RUN npm install --production

# Copy local code to the container image.
COPY . .

# Run the web service on container startup.
CMD [ "npm", "start" ]

# Inform Docker that the container is listening on the specified port at runtime.
EXPOSE 3001
