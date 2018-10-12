.PHONY: default publish

default: site

site:
	bundle exec ./build

deps:
	bundle install

clean:
	rm -rf site

publish: site
	env AWS_BUCKET=oscoin.io ./publish site

