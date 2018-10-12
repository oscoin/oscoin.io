FROM ruby AS site
WORKDIR /workspace

COPY Makefile Gemfile Gemfile.lock ./
RUN make deps
COPY . ./
RUN make site

FROM nginx:alpine AS nginx
COPY --from=site /workspace/site /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]

FROM ipfs/go-ipfs AS ipfs
WORKDIR /data/ipfs
COPY --from=site /workspace/site ./oscoin-website
RUN ipfs init && ipfs add --pin=true --quiet -r oscoin-website
CMD ["daemon", "--migrate=true"]
