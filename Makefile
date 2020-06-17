container:
	docker build . -t hazard_alert

run:
	docker run --rm -it hazard_alert sh

