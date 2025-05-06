all: generate validate_mock

.PHONY: validate_mock

generate: sdk.gen.go

sdk.gen.go: openapi.yml oapi-gen.yml
	oapi-codegen -config oapi-gen.yml openapi.yml

validate_mock:
	go build
