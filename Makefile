pull:
		docker pull botium/botium-cli

emulator:
		docker run --rm -v $(shell pwd):/app/workdir -it botium/botium-cli emulator console

crawl:
		sudo rm -rf crawler-result/scripts/
		docker run --rm -v $(shell pwd):/app/workdir -it botium/botium-cli crawler-run --numberOfWelcomeMessages 2 --waitForPrompt 1000 --depth 5

feedback:
		docker run --rm -v $(shell pwd):/app/workdir -it botium/botium-cli crawler-feedbacks

test:
		docker run --rm -v $(shell pwd):/app/workdir -it botium/botium-cli run --convos crawler-result/scripts