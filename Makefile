.PHONY: regen-dh
regen-dh:
	openssl dhparam -out ~/infra/metaproxy/nginx/certs/dhparam.pem 2048

.PHONY: docker-metaproxy
docker-metaproxy:
	docker-compose -f ~/infra/metaproxy/docker-compose.yml up -d
