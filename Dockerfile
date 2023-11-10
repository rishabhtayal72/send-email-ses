FROM ubuntu:22.04
RUN apt update -y
RUN apt install unzip curl -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN ./aws/install
RUN chmod +x get-http-5xx.sh
COPY . .