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
