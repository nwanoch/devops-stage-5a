#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Install dependencies
apt-get update
apt-get install -y nginx docker.io jq

# Copy the main script to /usr/local/bin
cp devopsfetch /usr/local/bin/
chmod +x /usr/local/bin/devopsfetch

# Set up systemd service
cat << EOF > /etc/systemd/system/devopsfetch.service
[Unit]
Description=DevOps Information Retrieval Service
After=network.target

[Service]
ExecStart=/usr/local/bin/devopsfetch -t '1 hour ago'
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

# Enable and start the service
systemctl enable devopsfetch.service
systemctl start devopsfetch.service

# Set up log rotation
cat << EOF > /etc/logrotate.d/devopsfetch
/var/log/devopsfetch.log {
    daily
    rotate 7
    compress
    delaycompress
    missingok
    notifempty
    create 0640 root root
}
EOF

echo "Installation completed successfully!"