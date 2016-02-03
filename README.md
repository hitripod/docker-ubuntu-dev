### How-To

```
docker build . -t kordan/ubuntu:16.04
docker run -itd --name ubuntu kordan/ubuntu:16.04
docker exec -it ubuntu zsh
```

### Reference

- [Best practives for writing Dockerfiles](https://docs.docker.com/engine/articles/dockerfile_best-practices/)
