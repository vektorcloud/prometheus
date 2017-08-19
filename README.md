# Prometheus

[![Circle CI](https://circleci.com/gh/vektorcloud/prometheus.svg?style=svg)](https://circleci.com/gh/vektorcloud/prometheus)

Minimal, Alpine-base image with Prometheus and optional basic auth

## Usage

Generate a basic auth config string:
```bash
docker run -ti --rm quay.io/vektorcloud/htpasswd:latest <user> <pass>
```

Then start Prometheus with the output from above:
```bash
docker run -e BASIC_AUTH='user:...' -p 9091:9091 quay.io/vektorcloud/prometheus:latest
```

Omit the `BASIC_AUTH` variable to disable auth
