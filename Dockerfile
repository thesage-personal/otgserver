# Use Alpine Linux as base image
FROM nginx:alpine

# Install ncat
RUN apk update && apk add nmap-ncat bash sudo

# Add a new user with sudo privileges
RUN adduser -D alpine && \
    echo "alpine ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Copy script to container
COPY entry.sh /tmp/entry.sh

EXPOSE 80 8181

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]

# Make HTML content
CMD [ "/bin/bash", "/tmp/entry.sh" ]
