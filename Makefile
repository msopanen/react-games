#----------------------------------------------------------#
# react-games monorepo
#----------------------------------------------------------#

# Build target components affected by latest uncommited change compared to master (origin/main)
BUILD_TARGETS	:= $(shell pnpm --filter="...[origin/main]" list -P --json | jq '.[] | .name')

install: 
	@echo Install dependencies for all
	@( pnpm run ci )


list-build-targets-chg: ${BUILD_TARGETS:%=list-build-targets/%}
list-build-targets/%:
	@echo component ${*}
