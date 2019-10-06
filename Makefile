build-container:
	docker build -t twitterbot .

tf-plan:
	cd terraform && \
	terraform fmt && \
	terraform plan -out=twitterbot.tfplan

tf-apply:
	cd terraform && \
	terraform apply twitterbot.tfplan

verify-syntax:
	cd scripts && \
	python3 -m py_compile twitterbot.py

run:
	cd scripts &&\
	pip3 install -r requirements.txt && \
	python3 twitterbot.py