.PHONY: start
start:
	@docker-compose up

.PHONY: stop
stop: 
	@docker-compose stop
