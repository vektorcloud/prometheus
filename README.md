# Prometheus

![circleci][circleci]


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

[circleci]: https://img.shields.io/circleci/project/github/vektorcloud/prometheus.svg "prometheus"
