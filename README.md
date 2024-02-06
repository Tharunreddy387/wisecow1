# Step 1: Install Prerequisites

# Step 2:Docker
  sudo apt install docker
  
  Start Docker
  systemctl start docker
  systemctl enable docker


# Step 3:minikube 
            # Install conntrack using apt
      sudo apt update
      sudo apt install conntrack -y
    
    # Download Minikube binary
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    
    # Grant execute permissions to the downloaded binary
    chmod +x minikube-linux-amd64
    
    # Move the binary to /usr/local/bin
    sudo mv minikube-linux-amd64 /usr/local/bin/minikube
    
    # Start Minikube
    /usr/local/bin/minikube start --force --driver=docker

# Step 4 : to install kubestall 
      # Download kubectl
      curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl
      
      # Make it executable
      chmod +x ./kubectl
      
      # Create the bin directory in your home directory
      mkdir -p $HOME/bin
      
      # Move kubectl to the bin directory
      mv ./kubectl $HOME/bin/kubectl
      
      # Add the bin directory to your PATH
      echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
      source $HOME/.bashrc
      
      # Verify kubectl version
      kubectl version --short --client

      

# Step 5: file tree 
      wisecow/
      │
      ├── .github/
      │   └── workflows/
      │       └── ci-cd.yaml
      │
      ├── k8s/
      │   ├── deployment.yaml
      │   ├── service.yaml
      │   └── tls-secret.yaml
      │
      ├── .gitignore
      ├── Dockerfile
      ├── README.md
      ├── wisecow.sh
      ├── assets/
      │   └── 9133227/
      │       └── 8d6bfde3-4a5a-480e-8d55-3fef60300d98
      │
      └── other_source_files_and_directories

# Step 6 : Build the Dockerfile in the repository
docker build -t wisecow:latest .
    
    # Tag the Docker image and push it to Docker Hub
    docker tag wisecow:latest tharunreddy387/wisecow:latest
    docker login
    docker push tharunreddy387/wisecow:latest


# Step 8 :Apply Kubernetes deployment
    kubectl apply -f kubernetes/deployment.yaml
    
    # Check pods
    kubectl get pods
    
    # Describe specific pod
    kubectl describe pod wisecow-deployment-<pod-name>

