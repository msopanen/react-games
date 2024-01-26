#----------------------------------------------------------#
# react-games monorepo
#----------------------------------------------------------#

# All pkgs, apps
ALL	:= $(shell pnpm -F=\!. -r list --only-projects --json | jq '.[] | .name')
PKG	:= $(shell pnpm -F=\!. -F=./pkg/** -r list --only-projects --json | jq '.[] | .name')
APP	:= $(shell pnpm -F=\!. -F=./app/** -r list --only-projects --json | jq '.[] | .name')
SVC	:= $(shell pnpm -F=\!. -F=./svc/** -r list --only-projects --json | jq '.[] | .name')

# All components affected by latest uncommited change compared to master (origin/main)
# including all dependants.
ALL_CHG	:= $(shell pnpm -F=\!. -F="...[origin/main]" list --only-projects --json | jq '.[] | .name')
# All pkgs affected by latest uncommited change compared to master (origin/main)
# including dependant pkgs.
PKG_CHG	:= $(shell pnpm -F=\!. -F=\!./app/** -F=\!./svc/** -F="...[origin/main]" list --only-projects --json | jq '.[] | .name')
# All apps affected by latest uncommited change compared to master (origin/main)
# including dependant apps.
APP_CHG	:= $(shell pnpm -F=\!. -F=\!./pkg/** -F=\!./svc/** -F="...[origin/main]" list --only-projects --json | jq '.[] | .name')
# All apps affected by latest uncommited change compared to master (origin/main)
# including dependant apps.
SVC_CHG	:= $(shell pnpm -F=\!. -F=\!./svc/** -F=\!./pkg/** -F="...[origin/main]" list --only-projects --json | jq '.[] | .name')

install: 
	@echo Install dependencies for all
	@( pnpm run ci )



list-all: ${ALL:%=list/%}
list-pkg: ${PKG:%=list/%}
list-app: ${APP:%=list/%}
list-svc: ${SVC:%=list/%}
list-chg-all: ${ALL_CHG:%=list/%}
list-chg-pkg: ${PKG_CHG:%=list/%}
list-chg-app: ${APP_CHG:%=list/%}
list-chg-svc: ${SVC_CHG:%=list/%}
list/%:
	@echo component ${*}
