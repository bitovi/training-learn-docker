<!-- markdownlint-disable MD041 -->

# Notes on the docker training doc

<https://www.bitovi.com/academy/learn-docker.html>

## Build Node App

1. Should add a step to add `node_modules` to `.gitignore`.

## Build and Run An Image

1. In the "view our image" section, there's a note that "There's also a node:15 image in our registry." This didn't happen in my run-through, and i don't think i've seen it happen before. Source images don't stay in the registry, right? I think this is a mistake.
2. Let's make more of a point of the port config in the "Customize the port" section. This is a common thing to do, it's easily misunderstood, and it's a good example of how to do it.

## Volumes and Local Development

1. In "Volumes", let's clarify the syntax of the volumes config. It's not clear that the first part is the host path and the second part is the container path. I think it's also worth mentioning that the host path is relative to the project root.
1. In "Local Development", the page appears incomplete. But the point is well-made by the example.

## Production Readiness

1. Grammar: `2` --> `two`

## Docker Compose

1. Just a quick note that the services will be named `<directory_name>_<service_name>_<index>`. This is a common source of confusion.

# New Sections

## Next Steps and Orchestration

1. Kubernetes
1. Docker Swarm _mostly deprecated in favor of k8s_
1. Docker Compose _not really orchestration, but a good next step_

## Alternatives to Docker

There are a lot of alternatives to Docker. I think it's worth mentioning them, but not going into detail. I think it's also worth mentioning that Docker is the most popular, and that it's the best place to start. When you're ready to grow your skillset, or encounter a scenario that could benefit/requires an alternative, you can look at the alternatives.

1. [Podman](https://podman.io/)
1. [Containerd](https://containerd.io/)
1. [colima](https://github.com/abiosoft/colima)
1. [Buildah](https://buildah.io/)
1. ...and many more...

## Tips & Tricks

### Aliases

Most devs know to use aliases to speed up often-used commands. Here are some of my favorites:

```sh
### DOCKER
# required for images built on mac M1 to work externally
# frequently need to *unset* for remote images to work correctly
alias set-docker-platform='DOCKER_DEFAULT_PLATFORM=linux/amd64'
alias sdp=set-docker-platform
alias unset-docker-platform='unset DOCKER_DEFAULT_PLATFORM'
alias udp=unset-docker-platform

# to use as $ca in docker commands
export ca='--container-architecture=linux/amd64'

# use as $ep in docker run/exec commands
export ep='--entrypoint /bin/bash'

alias d=docker

# docker compose <command>
alias dc='d compose'

# list images
alias dls='d images'

# list running containers
alias dps='d ps'

# list all containers including stopped
alias dpsa='d ps -a'

# list all containers including stopped, only showing IDs (useful for piping)
alias dpsaq='d ps -aq'

# remove an image from your local registry
alias drm='d image rm'

# docker run an image, removing it when it exits, and opening a shell
alias dr='d run --rm -it'

alias db='d build .'

# docker build and tag an image `dbt <tag>`
alias dbt='d build . -t'

# start docker on Mac
alias od='open -a docker'

# docker volume default command
alias dv='d volume'

# list docker volumes
alias dvls='dv ls'

# docker network default command
alias dn='d network'

# live tail logs of a container
alias dlogs='d logs --follow'

# open a shell in a running container
function shell() {
  if [ -z "$1" ]
  then
    echo "Please provide a container name/ID to shell into."
    return
  fi
  docker exec -it $1 /bin/bash 
}
```

### Advanced features

#### Docker commit

If you've launched a container and made changes to it, or want to inspect its state at a later date, you can't just `docker run` it again, as that will create a new container instance from the image.

You need to `docker commit` it to create a new image from the state of that specific container. Then you can `docker run` the new image to create a new container instance and inspect it.

```sh
docker commit <source_container_name> <new_image_name>
```

#### Docker inspect

```sh
# show the details of an image
docker inspect <image_name>
```

#### Docker top

```sh
# show the processes running in a container
docker top <container_name>
```

#### Docker exec

```sh
# run a command in a running container
docker exec <container_name> <command>

# typical usage is to run a shell to inspect or act on a running container
docker exec -it <container_name> /bin/bash
```

#### Docker cp

```sh
# copy a file from a container to the host
docker cp <container_name>:<path_to_file> <path_to_host>

# copy a file from the host to a container
docker cp <path_to_host> <container_name>:<path_to_file>
```

#### Docker run

```sh
# run a command in a new container
docker run <image_name> <command>

# run a command in a new container with a custom entrypoint
docker run --entrypoint <entrypoint> <image_name> <command>

# run a command in a new container with a custom entrypoint and arguments
docker run --entrypoint <entrypoint> <image_name> <command> <args>
```
