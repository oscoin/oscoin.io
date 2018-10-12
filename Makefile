FILES := *.html updates/*.html css/* jobs/*.html img/*

default:
	./build

.PHONY: default

publish:
	env AWS_BUCKET=oscoin.io ./publish $(FILES)

deps:
	bundle install

.PHONY: publish
