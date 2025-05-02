all: generate validate_mock

.PHONY: validate_mock

generate: sdk.gen.go sdk-schemas.gen.go

sdk.gen.go: openapi.yml oapi-gen.yml
	oapi-codegen -config oapi-gen.yml openapi.yml

sdk-schemas.gen.go: schemas.yml oapi-schemas-gen.yml
	oapi-codegen -config oapi-schemas-gen.yml schemas.yml

validate_mock:
	go build
