FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    tmate openssh-client curl python3 tmux tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# Copy startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
