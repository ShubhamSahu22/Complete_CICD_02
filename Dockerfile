# Use an official alpine nodeJS image as the base image
FROM node:alpine

# Create a non-root user and group
RUN addgroup -S nodegroup && adduser -S nodeuser -G nodegroup

# Set working directory in the container
WORKDIR /app

# Change ownership of the working directory to the new user
RUN chown -R nodeuser:nodegroup /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install only production nodeJS dependencies in Docker Image
RUN npm install --only=production

# Copy the rest of the application code into the container
COPY . .

# Switch to the non-root user
USER nodeuser

# Expose the app on a port
EXPOSE 3000

# Add a health check for the container
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 CMD wget --no-verbose --tries=1 --spider http://localhost:3000 || exit 1

# Command that runs the app
CMD ["npm", "start"]

