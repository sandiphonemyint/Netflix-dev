#!/bin/bash

# Step 1: Update system packages
sudo apt update
sudo apt upgrade -y

# Step 2: Install Java (OpenJDK 17)
sudo apt install openjdk-17-jdk -y
java -version

# Step 3: Add Jenkins repository key and source
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Step 4: Install Jenkins
sudo apt update
sudo apt install jenkins -y

# Step 5: Start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

# Step 6: Get Jenkins initial password
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Step 7: Open Jenkins in your browser
echo "Access Jenkins at: http://<YOUR_VM_EXTERNAL_IP>:8080"

