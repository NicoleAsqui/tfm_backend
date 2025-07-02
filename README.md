# How to Run the Project with Docker

## Prerequisites
- Docker installed on your machine.
- Docker Compose installed.

## Running the Containers

1. Open a terminal in the root folder of the project.

2. Execute the following command to start the services defined in `docker-compose.yml`:

   ```bash
   docker-compose up --build
3. Testing endpoints:
   ```bash
   http://localhost:8080/api/movements
   http://localhost:8080/api/alerts
   http://localhost:8080/api/investments
