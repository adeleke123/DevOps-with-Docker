# Task readme file

# Steps to Build and Run

# project directory structure:

```
project-root/
├── backend/
│   ├── Dockerfile
│   └── (other backend files)
├── frontend/
│   ├── Dockerfile
│   └── (other frontend files)
└── docker-compose.yml

```
# Navigate to the project root directory:
cd /path/to/project-root

# Build and run the containers:
sudo docker-compose up --build

# Verify the Setup:

- Access the frontend by opening the browser and navigating to http://localhost:5000.
- Ensure the frontend is able to communicate with the backend. 
- Open the developer console (F12 or cmd+shift+I) and 
- press the button for exercise 1.14. The button should respond if the configuration is correct.

# Stop the Containers:
- When you want to stop the containers, you can use the following command:

- sudo docker-compose down
