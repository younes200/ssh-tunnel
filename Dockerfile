FROM alpine:latest

LABEL maintener:Younes Benaomar <younes@0x53.dev>

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh", "-c" , "rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && ssh -o StrictHostKeyChecking=no -L $LOCAL_PORT:$LOCAL_HOST:$REMOTE_PORT $USERNAME@$REMOTE_HOST -N $SSH_EXTRA_OPTS"]
