# Stage 1
FROM node:17-alpine as builder

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock (if needed)
COPY package.json .
# COPY yarn.lock .

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# Stage 2
FROM nginx:1.19.0

# Set the working directory in the second stage
WORKDIR /usr/share/nginx/html

# Remove default Nginx contents
RUN rm -rf ./*

# Copy the build artifacts from the builder stage
COPY --from=builder /app/build .

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
