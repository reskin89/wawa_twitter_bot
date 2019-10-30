fetch-deps:
	go get github.com/dghubble/oauth1 && \
	go get github.com/dghubble/go-twitter/twitter

verify-syntax: fetch-deps
	go vet

build: fetch-deps
	go build -o wawatweetbot
