FILES := *.html updates/*.html css/* jobs/*.html img/*

default:
	mkdir -p jobs
	./build

.PHONY: default

publish:
	env AWS_BUCKET=oscoin.io ./publish $(FILES)

deps:
	bundle install

.PHONY: publish
