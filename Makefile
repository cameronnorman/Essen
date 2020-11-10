setup: build bundle

build:
	docker-compose build

bundle:
	docker-compose run --rm web bundle
	# docker-compose run --rm web rails webpacker:install

run:
	docker-compose up -d
	# docker-compose logs -f web

dev:
	docker-compose run --rm web ash

prod:
	docker build --target prod . -t essen:0.0.1
