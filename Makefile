fetch-deps:
	go get github.com/dghubble/oauth1 && \
	go get github.com/dghubble/go-twitter/twitter

verify-syntax: fetch-deps
	go vet

build: fetch-deps
	go build -o wawatweetbot

bootstrap-plan:
	cd terraform/tf-bootstrap && \
	terraform fmt && \
	terraform plan -out bootstrap.plan

bootstrap-apply:
	cd terraform/tf-bootstrap && \
	terraform apply bootstrap.plan

binary-bucket-plan:
	cd terraform && \
	terraform fmt && \
	terraform plan -out binbucket.plan

binary-bucket-apply:
	cd terraform/ && \
	terraform apply binbucket.plan
