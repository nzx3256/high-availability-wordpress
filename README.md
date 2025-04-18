Description
This project utilizes Docker containers to deploy a high-availability WordPress application. The setup includes WordPress, MySQL, and Nginx containers. To ensure the system remains operational even in the event of container failures, this architecture employs Docker Compose to manage multiple services. The project is designed for deployment on Google Cloud Platform (GCP) to distribute the load across multiple instances, ensuring fault tolerance and high availability.

Key Features:
  * WordPress application running in Docker containers.
  * MySQL database for WordPress backend.
  Nginx as a reverse proxy to distribute traffic.
  Easy deployment and scaling using Docker Compose.

Set Up
Prerequisites
Docker

Docker Compose

Google Cloud Platform (GCP) account for deployment (optional)

Installing Docker and Docker Compose
To get started, first install Docker and Docker Compose on your local machine or server:

bash
Copy
sudo apt update
sudo apt install docker.io
Next, install Docker Compose:

bash
Copy
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
Verify the installation:

bash
Copy
docker-compose --version
Clone the Repository
Clone the repository containing this project:

bash
Copy
git clone https://github.com/yourusername/high-availability-wordpress.git
cd high-availability-wordpress
Configuration
Make sure to modify the default database and WordPress passwords in the .env file for security. The .env file contains the following variables:

MYSQL_ROOT_PASSWORD

MYSQL_DATABASE

MYSQL_USER

MYSQL_PASSWORD

Change these to secure values before proceeding.

How to Run the Project
Using Docker Compose
In the directory where your docker-compose.yml file is located, run the following command to start the WordPress, MySQL, and Nginx containers:

bash
Copy
docker-compose up -d
This will pull the necessary images, create the containers, and start them in detached mode.

Scaling WordPress (Optional)
To scale the WordPress service and distribute the load across multiple containers, use the following command:

bash
Copy
docker-compose up --scale wordpress=3 -d
This command will run three WordPress containers to ensure high availability.

After the containers are up and running, navigate to http://<your-server-ip>:80 to access the WordPress installation. Follow the on-screen instructions to complete the WordPress setup.

How to Full Reset Everything
If you need to reset the entire Docker environment, including volumes, and remove all containers and images, use the following command:

bash
Copy
sudo docker system prune -a --volumes -f
This will remove all stopped containers, unused networks, and unused images, freeing up space.

Troubleshooting
Nginx not working: Check if Nginx is properly routing traffic to the WordPress containers. You can check Nginx logs using docker logs <nginx-container-name>.

MySQL connection issues: Ensure the MySQL container is running and accessible. Check MySQL logs using docker logs <mysql-container-name>.

Contributing
If you would like to contribute to this project, feel free to fork the repository and submit a pull request with your improvements. Please ensure that any changes are well-documented and tested.
