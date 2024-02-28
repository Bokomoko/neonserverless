# Start from a Debian image.
FROM debian:latest

# Install curl and unzip (needed to install Node.js and AWS CLI)
RUN apt-get update && apt-get install -y curl unzip

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

# Verify Node.js installation
RUN node --version
RUN npm --version

# Install Serverless and Neon neonctl npm packages globally
RUN npm install -g serverless neonctl

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install

# Verify AWS CLI installation
RUN aws --version

# Your application would go here
WORKDIR /workspace
