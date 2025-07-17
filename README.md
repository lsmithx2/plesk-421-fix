# Nginx/Apache SSL Configuration Fix Script

This repository contains a simple bash script designed to address common SSL configuration issues on servers running both Nginx and Apache, specifically by ensuring proper `proxy_ssl_server_name` and `proxy_ssl_name` directives are set for Nginx.

## 🚀 Getting Started

These instructions will get you a copy of the script up and running on your server.

### Prerequisites

* A Linux-based server (e.g., Ubuntu, Debian, CentOS, RHEL).

* Nginx and Apache installed and running.

* `sudo` privileges on the server.

### Installation and Execution

1.  **Download the script:**
    You can download the script directly to your server using `wget` or `curl`:

    ```bash
    wget https://raw.githubusercontent.com/lsmithx2/plesk-421-fix/refs/heads/main/nginx_apache_fix.sh
    ```
    or
    ```bash
    curl -O https://raw.githubusercontent.com/lsmithx2/plesk-421-fix/refs/heads/main/nginx_apache_fix.sh
    ```

2.  **Make the script executable:**
    Before running, you need to give the script execution permissions:

    ```bash
    chmod +x nginx_apache_fix.sh
    ```

3.  **Run the script:**
    Execute the script with `sudo` privileges. The script will provide progress updates as it runs.

    ```bash
    sudo ./nginx_apache_fix.sh
    ```

## ✨ What the Script Does

The `nginx_apache_fix.sh` script performs the following actions:

1.  **Adds Nginx SSL Configuration:** It creates or updates `/etc/nginx/conf.d/fixssl.conf` with the following lines:

    ```nginx
    proxy_ssl_server_name on;
    proxy_ssl_name $host;
    ```

    These directives are crucial for Nginx to correctly pass the server name to the backend (e.g., Apache) when acting as a reverse proxy, especially in environments where multiple SSL certificates are hosted.

2.  **Restarts Nginx Service:** After modifying the configuration, the script gracefully restarts the Nginx service to apply the changes.

## ⚠️ Important Notes

* **Backup:** It's always a good practice to back up your Nginx configuration files before running any script that modifies them.

* **Permissions:** The script requires `sudo` privileges to modify system files and restart services.

* **Verification:** After the script completes, it's recommended to verify that the changes have been applied correctly and that your websites are functioning as expected. You can check the contents of `/etc/nginx/conf.d/fixssl.conf` and the status of the Nginx service.

## 🤝 Contributing

If you find issues or have suggestions for improvements, feel free to open an issue or submit a pull request on the [GitHub repository](https://github.com/lsmithx2/plesk-421-fix).

## 📄 License

This project is open-source and available under the [MIT License](https://opensource.org/licenses/MIT).
