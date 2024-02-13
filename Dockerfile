# Use the official lightweight Node.js 14 image
FROM node:14-alpine

# Set the working directory
WORKDIR /frontend

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy project files and folders to the current working directory
COPY . .

# Expose port 8080
EXPOSE 8080

# Run the Vue.js application
CMD ["npm", "run", "serve"]