# PowerDNS playground

Here is a playground that allowed me to test the installation of [PowerDNS](https://github.com/PowerDNS/pdns) and [PowerDNS-Admin](https://github.com/PowerDNS-Admin/PowerDNS-Admin/).

This playground also contains an installation on a Scaleway instance: [`deployment_on_scaleway/`](./deployment_on_scaleway/).

## Local playground

This local playground is based on Docker.

I wrote the script [`provisioning/configure_powerdns_admin.py`](./provisioning/configure_powerdns_admin.py) to automate the creation of the `admin` user. 

```sh
$ docker compose up -d --wait
$ ./scripts/setup-powerdns-admin.sh
```

Go to http://localhost:9191 (default user: `admin` | password: `password`).

Adding a zone and a record in PowerDNS via CLI:

```sh
$ ./scritps/pdnsutil.sh create-zone example.com
$ ./scritps/pdnsutil.sh add-record example.com www A 192.0.2.1
```

Querying this DNS record:

```sh
$ dig www.example.com @127.0.0.1 -p 2000 +short
192.0.2.1
```

## Teardown

```sh
$ docker compose down -v
```
