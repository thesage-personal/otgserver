# Use Alpine Linux as base image
FROM nginx:alpine

# Install ncat
RUN apk update && apk add nmap-ncat bash sudo

# Set environment variable
ENV PORT=8181

# Add a new user with sudo privileges
RUN adduser -D alpine && \
    echo "alpine ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Set the working directory
WORKDIR /workspace

# Copy script to container
COPY entry.sh /workspace/entry.sh

EXPOSE 80 8181

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

# Make HTML content
CMD [ "/bin/bash", "/workspace/entry.sh" ]
