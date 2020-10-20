# Docker container for running R code

This is a Docker container containing packages which I use often.

To run the container interactively in your current directory use:

`docker run -it -v $(pwd):/home dmarcjones/r-bio:0.1`

To build and push the container:

```bash
docker build -t <dockerhub_ID>/r-bio:<version_number> ./
docker push <dockerhub_ID>/r-bio:<version_number>
```
