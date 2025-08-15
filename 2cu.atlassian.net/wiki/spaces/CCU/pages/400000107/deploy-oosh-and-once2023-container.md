[📁 Woda Training GitHub](/cerulean-circle-unlimited-2cu/product/development/woda/woda-training.md) | [🌐 Index Structure GitHub](/cerulean-circle-unlimited-2cu/product/development/woda/woda-training/deploy-oosh-and-once2023-container.md) | [🌐 Index Structure local SymLink](./deploy-oosh-and-once2023-container.entry.md)

# Deploy oosh and Once.2023 container

WORK IN PROGRESS

> ONCE is managing itself.
> 
> *– Marcel Donges,* 02 Feb 2023

# Deploy oosh

## Git repository

This is the ONCE shell you run. Development and fixes can be done in your local running environment. It is usually located in `/home/shared/EAMD.ucp/Components/com/ceruleanCircle/EAM/1_infrastructure/Once.sh/dev`.

Repository: `2cuGitHub:Cerulean-Circle-GmbH/once.sh.git`

Current way to deploy:

| **Table of content** |
| --- |
| - [Deploy oosh](#deploy-oosh)<br>  - [Git repository](#git-repository)<br>- [Deploy Once23](#deploy-once23)<br>  - [Git repository](#git-repository)<br>  - [Docker registry](#docker-registry)<br>  - [Deploy images into docker registry](#deploy-images-into-docker-registry) |

```
oo mode.dev # switches to dev branch

.... # make changes in the code of oosh
oo.mode     # shows branch status

oo commit   # commits latest changes to the oosh environment and publishes them.
oo release  # RELEASES and merges dev to prod. NEVER merge main to dev
oo update   # updates oosh environment and pulls latest changes from github.
```

Current branch policy:

![](./attachments/branch%20with%20oo.png)

# Deploy Once23

## Git repository

This is a repository for creating a deployable docker container with a development environment with oosh, ONCE server and WODA. Located whereever you git clone it.

Repository: `2cuGitHub:Cerulean-Circle-GmbH/Once.2023.git`

## Docker registry

[https://hub.docker.com/r/donges/once/tags](https://hub.docker.com/r/donges/once/tags)

| **registry** | **repository** | **tags** | **platforms** |
| --- | --- | --- | --- |
| `docker.io` | `donges/once` | `0.1`, `latest` | `linux/arm64/v8`,`linux/amd64` |

External docs:

- [https://nickjanetakis.com/blog/docker-tip-53-difference-between-a-registry-repository-and-image#:~:text=A registry stores a collection,are individually versioned with tags.](https://nickjanetakis.com/blog/docker-tip-53-difference-between-a-registry-repository-and-image#:~:text=A%20registry%20stores%20a%20collection,are%20individually%20versioned%20with%20tags.)
- [https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/)

## Deploy images into docker registry

> [!INFO]
> Docker Buildx must be installed. Check this with:
> `docker buildx`
> See also [https://docs.docker.com/build/install-buildx/](https://docs.docker.com/build/install-buildx/)

- Check out `2cuGitHub:Cerulean-Circle-GmbH/Once.2023.git`
- Go to `once.sh.ts/src/docker/once.sh.ubuntu.22.04`
- Call

```
# start up "buildx" build kit to be able to create images multi architecture
devTool docker.buildx.use

# Build and startup locally to test
devTool docker.build
devTool docker.up

# Login to registry (you have to know the password ;-)
echo $DOCKER_PASSWORD | docker login -u donges --password-stdin

# build and push multi architecture
devTool docker.buildx.push

# Get the compose file and replace "latest" inside the compose file
# with the specific version number
curl -O https://raw.githubusercontent.com/Cerulean-Circle-GmbH/once.sh/main/once.2023/docker-compose.yml

# Test the container (ideally on both platforms)
docker compose -f docker-compose.yml up

# push the "latest" tag to the new version
devTool docker.buildx.push.latest
```
