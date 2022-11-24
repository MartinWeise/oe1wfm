.PHONY: clean

all:

install:
	pip3 install -r requirements.txt

verify:
	sudo nginx -t

build:
	mkdocs build

configure:
	sudo certbot certonly --standalone --preferred-challenges http -d oe1wfm.at --agree-tos --keep-until-expiring

deploy:
	sudo cp -r ./site/* /usr/share/nginx/html/oe1wfm.at/
