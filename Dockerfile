# Use Debian bullseye as the base image
FROM debian:bullseye

# Install curl, sudo, and bash
RUN apt-get update && \
    apt-get install -y curl sudo bash && \
    rm -rf /var/lib/apt/lists/*

# Run the CasaOS installation script
RUN curl -fsSL https://get.casaos.io | sudo bash

# Default command
CMD ["bash"]
