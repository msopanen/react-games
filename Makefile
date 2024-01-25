#----------------------------------------------------------#
# react-games monorepo
#----------------------------------------------------------#

# All pkgs, apps
ALL	:= $(shell pnpm --filter=\!. -r list --only-projects --json | jq '.[] | .name')
PKG	:= $(shell pnpm --filter=\!. --filter=\!./app/** -r list --only-projects --json | jq '.[] | .name')
APP	:= $(shell pnpm --filter=\!. --filter=\!./pkg/** -r list --only-projects --json | jq '.[] | .name')

# All components affected by latest uncommited change compared to master (origin/main)
# including all dependants.
ALL_CHG	:= $(shell pnpm --filter=\!. --filter="...[origin/main]" list --only-projects --json | jq '.[] | .name')
# All pkgs affected by latest uncommited change compared to master (origin/main)
# including dependant pkgs.
PKG_CHG	:= $(shell pnpm --filter=\!. --filter=\!./app/** --filter="...[origin/main]" list --only-projects --json | jq '.[] | .name')
# All apps affected by latest uncommited change compared to master (origin/main)
# including dependant apps.
APP_CHG	:= $(shell pnpm --filter=\!. --filter=\!./pkg/** --filter="...[origin/main]" list --only-projects --json | jq '.[] | .name')



install: 
	@echo Install dependencies for all
	@( pnpm run ci )



list-all: ${ALL:%=list/%}
list-pkg: ${PKG:%=list/%}
list-app: ${APP:%=list/%}
list-chg-all: ${ALL_CHG:%=list/%}
list-chg-pkg: ${PKG_CHG:%=list/%}
list-chg-app: ${APP_CHG:%=list/%}
list/%:
	@echo component ${*}
