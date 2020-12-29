TRUFFLE=npx truffle
GANACHE=npx ganache-cli

all: testnet-simcity deploy simcity

.PHONY: test
test:
	$(TRUFFLE) test

testnet-simcity-andy:
	$(GANACHE) -v -m "twenty bulk regular excess orchard blade route lyrics rail panic federal crawl" -e 1000000
simcity-andy: deploy simcity

testnet-simcity:
	gnome-terminal -- /bin/sh -c 'cd ./HODL2; ./node_modules/.bin/ganache-cli -m "twenty bulk regular excess orchard blade route lyrics rail panic federal crawl" -e 1000000'

testnet-10:
	$(GANACHE) -a 10

deploy:
	$(TRUFFLE) migrate --network development --reset --skip-dry-run

simcity: welcome current

live: current future

welcome:
	$(TRUFFLE) exec ./simcity/welcome.js

current:
	$(TRUFFLE) exec ./simcity/current.js

future:
	$(TRUFFLE) exec ./simcity/future.js
