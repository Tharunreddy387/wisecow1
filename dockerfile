FROM ubuntu:latest

# Install prerequisites
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay && \
    rm -rf /var/lib/apt/lists/*


# Set the working directory
WORKDIR /app

# Copy the Bash script to the working directory
COPY wisecow.sh .

# Make the script executable
RUN chmod +x wisecow.sh

# Expose the port on which the application will run
EXPOSE 4499

# Command to start the application
CMD ["./wisecow.sh"]














