# Use the official Node.js 16 image as the base
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY backend/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY backend/ .

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]