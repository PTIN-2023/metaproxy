.PHONY: regen-dh
regen-dh:
	openssl dhparam -out ~/infra/metaproxy/nginx/certs/dhparam.pem 2048

.PHONY: regen-keys
regen-keys:
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ~/infra/metaproxy/nginx/certs/nginx-selfsigned.key -out ~/infra/metaproxy/nginx/certs/nginx-selfsigned.crt -subj '/CN=*.xn--ina.com/O=Gesys./C=ES'
	chown -R user:user ~/infra/metaproxy/nginx/certs/

.PHONY: docker-metaproxy
docker-metaproxy:
	docker-compose -f ~/infra/metaproxy/docker-compose.yml up -d
