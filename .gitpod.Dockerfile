FROM gitpod/workspace-full

# Install MySQL
RUN sudo apt-get update && \
    sudo apt-get install -y mysql-server && \
    sudo apt-get clean

# Install phpMyAdmin
RUN sudo apt-get update && \
    sudo apt-get install -y phpmyadmin && \
    sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Allow password authentication
RUN sudo sed -i "s/bind-address/#bind-address/g" /etc/mysql/mysql.conf.d/mysqld.cnf && \
    sudo service mysql restart

# Expose phpMyAdmin port
EXPOSE 8080
