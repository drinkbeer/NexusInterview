build:
	docker build -t drinkbeer/nexus_interview_app:latest .

start:
ifdef apikey
	make build
	docker run -it --env IPSTACK_API_KEY=$(apikey) --env REDIS_URL=$(redis-url) --env REDIS_PASSWORD=$(redis-password) -p 8080:8080  drinkbeer/nexus_interview_app
else
	make build
	docker run drinkbeer/nexus_interview_app
	echo "Please mention apikey before you start. Now runs the app."
endif

push:
	make build
	docker push drinkbeer/nexus_interview_app
