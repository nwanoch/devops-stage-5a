# DevOpsFetch

This command line tool called `DevOpsFetch` is a powerful command-line tool designed for DevOps professionals to quickly retrieve and display critical system information. It provides easy access to details about active ports, Docker containers, Nginx configurations, user logins, and system activities within specified time ranges.

## Features

- Display active ports and services
- List Docker images and containers
- Show Nginx domain configurations
- View user login information
- Monitor system activities within custom time ranges
- Formatted output for easy readability

## Installation

1. Clone this repository:
2. Make the installation script executable:

```bash
chmod +x install.sh
```

3. Run the installation script as root:

```bash
sudo ./install.sh
```

4. Run to view help options

```bash
devopsfetch -h
```

5. Usage Options:
   -p, --port [PORT]: Display active ports or specific port info
   -d, --docker [NAME]: List Docker images/containers or specific container info
   -n, --nginx [DOMAIN]: Display Nginx domains or specific domain config
   -u, --users [USER]: List users and last login or specific user info
   -t, --time RANGE: Display activities within a time range (e.g., '1 hour ago')
   -h, --help: Display help message

Examples

1. Display all active ports:

```bash
devopsfetch -p
```

2. Display information about a specific port:

```bash
devopsfetch -p 80
```

3. List all Docker containers:

```bash
devopsfetch -d

```

4. Get detailed information about a specific Docker container:

```bash
devopsfetch -d container_name

```

5. Display all Nginx domains:

```bash
devopsfetch -n

```

6. Get Nginx configuration for a specific domain:

```bash
devopsfetch -n example.com

```

7. List all users and their last login times:

```bash
devopsfetch -u

```

8. Get last login information for a specific user:

```bash
devopsfetch -u username

```

9. Display activities within the last hour:

```bash
devopsfetch -t '1 hour ago'

```

## Installation Detailed Process

The `install.sh` script performs the following actions:

1. Updates the system package list.
2. Installs necessary dependencies:

   - nginx
   - docker.io
   - jq (for JSON parsing)

3. Copies the main `devopsfetch` script to `/usr/local/bin/`, making it accessible system-wide.

4. Sets the appropriate permissions to make the script executable.

5. Creates a systemd service file (`/etc/systemd/system/devopsfetch.service`) to run the script periodically.

6. Enables and starts the systemd service.

7. Sets up log rotation for the devopsfetch logs to manage log file sizes and retention.

After running the installation script, devopsfetch will be installed as a system-wide command and a background service will be set up to periodically collect and log system information.

Note: The installation requires root privileges to install packages and set up system services.

## Uninstallation

To uninstall devopsfetch:

1. Stop and disable the systemd service:

   ```bash
   sudo systemctl stop devopsfetch.service
   sudo systemctl disable devopsfetch.service

   ```

2. Remove the service file:

```bash
sudo rm /etc/systemd/system/devopsfetch.service
```

3. Remove Main script:

```bash
sudo rm /usr/local/bin/devopsfetch
```

4. Remove the log rotation configuration

```bash
sudo rm /etc/logrotate.d/devopsfetch
```

Note: This will not uninstall the dependencies (nginx, docker.io, jq) as they might be used by other applications.
