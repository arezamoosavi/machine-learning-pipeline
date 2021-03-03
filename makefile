.PHONY: postgres mlflow build down logs exec-mlflow stop-mlflow

logs:
	docker-compose logs -f

postgres:
	docker-compose up -d postgres

mlflow:
	docker-compose up -d mlflow

build:
	docker-compose up --build -d mlflow

exec-mlflow:
	docker-compose exec mlflow bash

stop-mlflow:
	docker-compose stop mlflow
	docker-compose rm mlflow

down:
	docker-compose down -v