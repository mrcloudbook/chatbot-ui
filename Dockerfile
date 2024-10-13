# Use the Node.js official image as a parent image
FROM node:21.5.0-bookworm

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json 
COPY package.json ./

# Install additional dependencies
RUN npm install

# Copy the rest of the application to the container working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Set the environment to production to reduce Next.js application size
ENV NODE_ENV production

# Expose the port the app runs on
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
