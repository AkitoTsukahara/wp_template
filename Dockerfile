FROM wordpress:5.0.3-php7.2

RUN apt-get update && apt-get install -y less wget subversion mysql-client

# phpunitをインストール
RUN wget https://phar.phpunit.de/phpunit-6.1.0.phar && \
    chmod +x phpunit-6.1.0.phar  && \
    mv phpunit-6.1.0.phar /usr/local/bin/phpunit

# WP-CLIをインストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp
