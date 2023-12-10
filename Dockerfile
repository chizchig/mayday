# First Phase: Build Phase
FROM node:14 AS builder

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the current directory contents into the container at /app
COPY . .

# Perform any build steps if needed (e.g., compiling TypeScript, building assets)
# RUN npm run build

# Second Phase: Runtime Phase
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy only the necessary files from the builder image
COPY --from=builder /app .

# Update package lists and install gke-gcloud-auth-plugin
RUN apt-get update && \
    apt-get install -y --no-install-recommends gke-gcloud-auth-plugin && \
    rm -rf /var/lib/apt/lists/*

# Expose the port that your app will run on
EXPOSE 3000

# Define the command to run your app
CMD ["node", "server.js"]
