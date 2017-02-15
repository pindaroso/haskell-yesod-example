YESOD=haskellyesodexample_yesod_1

all:
	@docker-compose build
	@docker-compose up -d

bash:
	@docker exec -it $(YESOD) bash

up:
	@docker-compose build && docker-compose up -d --remove-orphans

devel:
	@docker exec -it $(YESOD) bash -c ". /home/robot/.nix-profile/etc/profile.d/nix.sh && \
    	nix-shell --command 'yesod devel'"

ghci:
	@docker exec -it $(YESOD) bash -c ". /home/robot/.nix-profile/etc/profile.d/nix.sh && \
    	nix-shell --command 'cabal repl --ghc-options=\"-O0 -fobject-code\"'"

keter:
	@docker exec -it $(YESOD) bash -c ". /home/robot/.nix-profile/etc/profile.d/nix.sh && \
		export GLIBC_PRIVATE=1 && \
		mkdir -p /tmp/yesod/src && rm -rf /tmp/yesod/src && \
		cp -R /opt/yesod-nix-example /tmp/yesod/src && \
		cd /tmp/yesod/src && nix-shell --command 'yesod keter' && \
		mv -f /tmp/yesod/src/yesod-nix-example.keter /opt/yesod/ && \
		rm -rf /opt/keter/incoming/yesod-nix-example.keter && \
		cp /opt/yesod/yesod-nix-example.keter /opt/keter/incoming"
