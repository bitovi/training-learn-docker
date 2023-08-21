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
