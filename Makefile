################################################################################

# This Makefile generated by GoMakeGen 0.8.0 using next command:
# gomakegen .

################################################################################

.DEFAULT_GOAL := help
.PHONY = fmt all clean deps deps-test test help

################################################################################

all: init-exporter ## Build all binaries

init-exporter: ## Build init-exporter binary
	go build init-exporter.go

install: ## Install binaries
	cp init-exporter /usr/bin/init-exporter

uninstall: ## Uninstall binaries
	rm -f /usr/bin/init-exporter

deps: ## Download dependencies
	git config --global http.https://pkg.re.followRedirects true
	go get -d -v pkg.re/essentialkaos/ek.v9
	go get -d -v pkg.re/essentialkaos/go-simpleyaml.v1

deps-test: ## Download dependencies for tests
	git config --global http.https://pkg.re.followRedirects true
	go get -d -v pkg.re/check.v1
	go get -d -v pkg.re/essentialkaos/ek.v9

test: ## Run tests
	go test -covermode=count ./...

fmt: ## Format source code with gofmt
	find . -name "*.go" -exec gofmt -s -w {} \;

clean: ## Remove generated files
	rm -f init-exporter

help: ## Show this info
	@echo -e '\nSupported targets:\n'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[33m%-12s\033[0m %s\n", $$1, $$2}'
	@echo -e ''

################################################################################
