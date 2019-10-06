FROM alpine:3.9

LABEL for="Twitter Bot Wawa Pizza"

WORKDIR /usr/local/src/

COPY requirements.txt /usr/local/src/requirements.txt

RUN apk add --update zsh git make python3 curl jq

RUN pip3 install -r requirements.txt

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip && \
unzip /tmp/terraform.zip -d /tmp && \
mv /tmp/terraform /usr/local/bin

RUN wget https://github.com/concourse/concourse/releases/download/v5.6.0/fly-5.6.0-linux-amd64.tgz && \
tar -xvzf fly-5.6.0-linux-amd64.tgz && \
mv fly /usr/local/bin/fly && \
chmod 755 /usr/local/bin/fly