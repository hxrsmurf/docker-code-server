# docker-code-server
[![Deploy to Amazon](https://github.com/hxrsmurf/docker-code-server/actions/workflows/aws.yaml/badge.svg)](https://github.com/hxrsmurf/docker-code-server/actions/workflows/aws.yaml)

[![Build All](https://github.com/hxrsmurf/docker-code-server/actions/workflows/build-all.yml/badge.svg)](https://github.com/hxrsmurf/docker-code-server/actions/workflows/build-all.yml)

My version of code-server in Docker

# Procedure

Update the password, git config email, and git config name in
1. In `docker-code-server/config/config.yaml`, update the password
2. In `docker-code-server/templates/coder/variables.tf`, update name, email, and username
3. Run `docker-code-server/nginx/generate-ssl.sh` to generate self-signed SSLs for NGINX
4. Run `getent group docker | cut -d: -f3` to get the group id for docker
5. Update `docker-code-server/docker-compose.yaml` with that group id
6. Run `docker-compose up -d --build` to build a new image
7. Access via `https://[ServerIp]:8080`

# Docs
- https://github.com/coder/code-server
- https://hub.docker.com/r/linuxserver/code-server

# Diagram
```mermaid
graph TB;
    subgraph OVH
        docker-compose -- /var/run/docker.sock --> coder
    end
    subgraph templates
        code-server -- OVH Docker --> Docker
        aws-spot -- Spot Request --> AWS
        docker -- Ubuntu --> base
        base --> debian
        base --> node
        base --> python
    end
    subgraph extensions
        vim
        ghpr[GitHub Pull Requests]
        Terraform
        Prettier
    end
    coder --> templates
    templates -- All templates have these --> extensions
```
