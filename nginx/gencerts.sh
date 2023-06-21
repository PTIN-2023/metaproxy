#!/bin/sh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./certs/nginx-selfsigned.key -out ./certs/nginx-selfsigned.crt -subj '/CN=craaxkvm.epsevg.upc.es/O=Gesys./C=ES'
