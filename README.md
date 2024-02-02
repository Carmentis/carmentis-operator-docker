# Carmentis Operator Server

This document provides instructions on how to launch, manage, and interact with the Carmentis Operator Server using Docker and Docker Compose. Instructions are provided for both Unix and Windows operating systems.

---
**Note:** The Operator Server is currently in alpha and is not yet ready for production use. The Operator Server is currently only available for the Carmentis testnet.

---

## Prerequisites

Before proceeding, ensure you have the following installed:
- Docker
- Docker Compose

## Installation

Clone the repository and navigate to the directory where the `docker-compose.yml` file is located.

## Configuration (coming soon)

Create a `.env` file in the same directory as the `docker-compose.yml` file. This file is used to set environment variables for the application. 

| Variable            | Description                                                  | Default Value                    |
|---------------------|--------------------------------------------------------------|----------------------------------|
| `WEB_DOMAIN`        | The domain name of the Carmentis webview for the proofpages. | `https://testnet.carmentis.io`   |
| `NODE_URL`          | The URL of the Carmentis node.                               | `https://mercurius.carmentis.io` |
| `DB_ADMIN_USER`     | The username of the internal database administrator.         | `postgres`                       |
| `DB_ADMIN_PASSWORD` | The password of the internal database administrator.         | **********                       |
| `DB_HOST`           | The hostname of the internal database.                       | `db`                             |
| `DB_PORT`           | The port of the internal database.                           | `5432`                           |

## Managing the Application

### Unix Users

1. **Starting the Application:** Run `./scripts/operator.sh start` to start the application. This command launches the Operator service in detached mode.

2. **Stopping the Application:** Execute `./scripts/operator.sh stop` to stop and remove container instances.

3. **Restarting the Application:** Use `./scripts/operator.sh restart` to restart the Operator service.

4. **Viewing Logs:** To view the application logs, run `./scripts/operator.sh logs`.

5. **Checking the Status:** For the current status of the service, execute `./scripts/operator.sh status`.
6. **Upgrading the Application:** To update the application, run `./scripts/operator.sh update`.
7. **Resetting the Application:** To reset the application's database, execute `./scripts/operator.sh reset:db`.

### Windows Users

1. **Starting the Application:** Run `scripts/operator.cmd start` in the command prompt to start the application.

2. **Stopping the Application:** Use `scripts/operator.cmd stop` to stop and remove container instances.

3. **Restarting the Application:** To restart the Operator service, execute `scripts/operator.cmd restart`.

4. **Viewing Logs:** View the application logs by running `scripts/operator.cmd logs`.

5. **Checking the Status:** Check the current status of the service with `scripts/operator.cmd status`.
6. **Upgrading the Application:** To update the application, run `scripts/operator.cmd update`.
7. **Resetting the Application:** To reset the application's database, execute `scripts/operator.cmd reset:db`.

## Additional Notes

- The .data/db directory is used to store the application's database files. This directory is created automatically when the application is started.
- The .data/storage directory is used to store the application's storage files, and in particular the signing private key that you should take care to backup. This directory is created automatically when the application is started.
- You can test your own operator with our swagger available on http://www.dev.carmentis.io:8080/
