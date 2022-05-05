# pritunl-helm-chart

Basic Pritunl VPN Helm Chart.

Currently only supports OpenVPN via TCP on port 1194.

## Dependencies

Have a running MongoDB instance with a dedicated user for pritunl (recommended).

For example the [bitnami MongoDB helm chart](https://artifacthub.io/packages/helm/bitnami/mongodb) works well (had no luck using AWS DocumentDB).

## Possible improvements

- fine tune resource requests and limits
- AWS only: switch to NLB instead of Classis LB
- support wireguard / udp server, maybe needs a second loadBalancer (depending on your cloud provider)
- HTTP and HTTPS could be handled by an Ingress instead (again, depending on your cloud provider)

## Related resources

- https://github.com/goofball222/pritunl
- https://github.com/jippi/docker-pritunl
