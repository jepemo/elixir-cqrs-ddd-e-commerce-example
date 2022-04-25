.PHONY: start
start:
	@docker-compose up --remove-orphans

.PHONY: stop
stop: 
	@docker-compose stop
