#!/bin/bash

# This script will fix the problem with the recent plesk update.
# Development by LSmithx2 (www.lsmith.co.uk)

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Error: This script must be run as root or with sudo."
  echo "Please run: sudo ./nginx_ssl_fix.sh"
  exit 1
fi

echo "Starting Nginx SSL configuration fix..."
echo "---------------------------------------"
sleep 1

# Step 1: Add SSL server name configuration to /etc/nginx/conf.d/fixssl.conf
echo "1/2: Adding 'proxy_ssl_server_name on;' and 'proxy_ssl_name \$host;' to /etc/nginx/conf.d/fixssl.conf..."
if echo -e "proxy_ssl_server_name on;\nproxy_ssl_name \$host;" | sudo tee /etc/nginx/conf.d/fixssl.conf > /dev/null; then
  echo "   [OK] Configuration added successfully."
else
  echo "   [ERROR] Failed to add configuration. Please check permissions or path."
  exit 1
fi
sleep 2

# Step 2: Restart Nginx service
echo "2/2: Restarting Nginx service..."
if sudo service nginx restart; then
  echo "   [OK] Nginx service restarted successfully."
else
  echo "   [ERROR] Failed to restart Nginx service. Please check Nginx status or logs."
  exit 1
fi
sleep 1

echo "---------------------------------------"
echo "Nginx SSL configuration fix completed."
echo "You can verify the changes by checking /etc/nginx/conf.d/fixssl.conf and Nginx service status."
