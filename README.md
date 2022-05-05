# pritunl-helm-chart

Basic Pritunl VPN Helm Chart.

Currently only supports OpenVPN via TCP on port 1194.

## Possible improvements

- support wireguard / udp server, maybe needs a second loadBalancer (depending on your cloud provider)
- HTTP and HTTPS could be handled by an Ingress instead (again, depending on your cloud provider)

## Related resources

- https://github.com/goofball222/pritunl
- https://github.com/jippi/docker-pritunl
