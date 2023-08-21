# Notes on the training doc

## Build and Run An Image

1. In the "view our image" section, there's a note that "There's also a node:15 image in our registry." This didn't happen in my run-through, and i don't think i've seen it happen before. Source images don't stay in the registry, right? I think this is a mistake.
2. Let's make more of a point of the port config in the "Customize the port" section. This is a common thing to do, it's easily misunderstood, and it's a good example of how to do it.

## Volumes and Local Development

1. In "Volumes", let's clarify the syntax of the volumes config. It's not clear that the first part is the host path and the second part is the container path. I think it's also worth mentioning that the host path is relative to the project root.
1. In "Local Development", the page appears incomplete. But the point is well-made by the example.

## Production Readiness

1. Grammar: `2` --> `two`

## Docker Compose

