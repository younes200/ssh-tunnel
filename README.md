# Docker SSH Tunnel

<div align="left">

[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/younes200/ssh-tunnel/docker-publish.yml?style=for-the-badge)](https://github.com/younes200/ssh-tunnel/actions/workflows/docker-publish.yml)
[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/younes200/ssh-tunnel?sort=semver&style=for-the-badge)](https://github.com/younes200/ssh-tunnel/releases)

</div>

This is a simple SSH reverse tunnel to forward your remote port to a local server without the needing to change any configuration on your router. You can use this to expose your local applications to internet.

## Usage

You should have your local server SSH Key renamed as id_rsa. For simplicity you can copy the key to ~/.ssh in your local machine.

Now in docker-compose.yml you can define the reverse tunnel as follows:

```yml
    version: '2'
    services:
      reverse-tunnel:
        image: ghcr.io/younes200/ssh-tunnel
        volumes:
          - $HOME/.ssh:/root/ssh
        environment:
          LOCAL_HOST: localhost
          LOCAL_PORT: <local application port>
          REMOTE_HOST: <remote server hostname/IP>
          REMOTE_PORT: <remote port which should listen to your local port>
          USERNAME: <remote server username>
          SSH_EXTRA_OPTS: "-v -o ServerAliveInterval=60"
```

Run ```docker-compose up -d``` from your local machine

After you start up docker containers, the remote application container port can be accessed from your local server and from the internet if the remote server is having the corresponding port open
