# ssc generator

## Description

A simple docker container Self Signed Certificate generator for testing purpose.

🐳 Image is build anb pushed to dockerhub at [ssc_generator](https://hub.docker.com/repository/docker/tinycompany/ssc_generator/general)

## Usage

1. First set the env var :

- `CERT_COUNTRY` : two-letter code of your country. For instance, US
- `CERT_STATE` : name of the state where your organization is officially registered. For example, California
- `CERT_LOCALITY` : locality or city name where your company resides: For example, San Jose
- `CERT_ORGANIZATION` : official name of your organization
- `CERT_ORGANIZATIONAL_UNIT` : unit name within your organization responsible for managing SSL certificates. For example, IT.
- `CERT_COMMON_NAME` : Fully Qualified Domain Name (FQDN) you want to secure or your name. For instance "test.com"

>Note : these var can be added in a env file, see [env.example file](./example.env)

2. Start the container using a volume to store generated key and certificate on the host :
```
docker run  --env-file .env
```