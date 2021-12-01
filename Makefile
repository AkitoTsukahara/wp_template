help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up:  ## 開発環境の立ち上げ
	@docker-compose up -d

down:  ## 開発環境を落とす
	@docker-compose down
