.PHONY: regen-dh
regen-dh:
	openssl dhparam -out ~/infra/metaproxy/nginx/certs/dhparam.pem 2048

.PHONY: regen-keys
regen-keys:
	# Root certificate (to avoid a self-signed cert)
	openssl genrsa -des3 -out nginx/certs/ca.key 2048
	openssl req -new -key nginx/certs/ca.key -out nginx/certs/ca-cert-request.csr -sha256 -subj '/CN=*.xn--ina.com/O=TransMed./C=ES'
	openssl x509 -req -in nginx/certs/ca-cert-request.csr -signkey nginx/certs/ca.key -out nginx/certs/ca-root-cert.crt -days 365 -sha256
	# Server cert
	openssl genrsa -out nginx/certs/server.key 2048
	openssl req -new -key nginx/certs/server.key -out nginx/certs/server-cert-request.csr -sha256  -subj '/CN=*.xn--ina.com/O=TransMed./C=ES'
	openssl x509 -req -in nginx/certs/server-cert-request.csr -CA nginx/certs/ca-root-cert.crt -CAkey nginx/certs/ca.key -CAcreateserial -out nginx/certs/server.crt -days 360

.PHONY: docker-metaproxy
docker-metaproxy:
	docker-compose -f ~/infra/metaproxy/docker-compose.yml up -d
