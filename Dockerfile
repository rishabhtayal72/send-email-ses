FROM tayal13/python-boto3:v2
# RUN apt update -y
# RUN apt install python3 -y
# RUN apt install python3-pip -y
# RUN pip3 install boto3
# RUN apt install unzip curl jq -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
COPY . .
RUN chmod +x get-http-5xx.sh
CMD ["bash", "-c", "./get-http-5xx.sh"]