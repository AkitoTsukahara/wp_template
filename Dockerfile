FROM wordpress:5.3.0-php7.2

RUN apt-get update && apt-get install -y less wget subversion mariadb-client

# phpunitをインストール
RUN wget https://phar.phpunit.de/phpunit-6.1.0.phar && \
    chmod +x phpunit-6.1.0.phar  && \
    mv phpunit-6.1.0.phar /usr/local/bin/phpunit

# WP-CLIをインストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
chmod +x wp-cli.phar && \
mv wp-cli.phar /usr/local/bin/wp

# 必要なツール郡をインストール
RUN apt-get -y install wget unzip

# WP プラグイン (zip) ダウンロード（自由に追加可能。確認用に適当なプラグインをダウンロード）
RUN wget -P /tmp/wp-plugins https://downloads.wordpress.org/plugin/contact-form-7.4.6.zip
RUN wget -P /tmp/wp-plugins https://downloads.wordpress.org/plugin/syntaxhighlighter.zip
RUN wget -P /tmp/wp-plugins https://downloads.wordpress.org/plugin/wp-emmet.zip

# Zip ファイルを解凍してインストール
RUN unzip '/tmp/wp-plugins/*.zip' -d /usr/src/wordpress/wp-content/plugins

# 不要になった一時ファイルを削除
RUN apt-get clean
RUN rm -rf /tmp/*
