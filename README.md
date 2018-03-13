# docker-puppetmaster

Docker image for launching a **Puppet Master** server.

Autosigning is turned *on* in `puppet.conf`.

## Usage

```shell
$ docker run \
    -d \
    --name puppetmaster \
    -h puppet \
    -p 8140:8140 \
    -v puppetmaster_config:/etc/puppet \
    -v puppetmaster_lib:/var/lib/puppet \
    bigbrozer/puppetmaster:latest
```

To see list of certs:

```shell
$ docker exec puppetmaster puppet cert list --all
```

Test puppet on client with:

```shell
$ puppet agent --test --server <puppetmaster_hostname>
```

You should see the cert request being generated and autosigned.

## Reference

Forked from [macadmins/docker-puppetmaster](https://github.com/macadmins/docker-puppetmaster).
