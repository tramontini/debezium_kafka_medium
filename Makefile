.PHONY: build run clean docker-run docker-down

clean:
	rm -rf target/ log/ data/

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down --remove-orphans -v

docker-build:
	docker-compose down --remove-orphans -v
	docker-compose up -d

#deploy-hml-matrix:
#	git tag -f build-matrix
#	git push --force origin build-matrix
