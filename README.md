# Pritunl VPN Server Helm Chart

Basic Pritunl VPN Helm Chart. Only implements OpenVPN on 1194/TCP.

## Dependencies

A running MongoDB instance with a dedicated user for pritunl (recommended). For example the [bitnami MongoDB helm chart](https://artifacthub.io/packages/helm/bitnami/mongodb) works well (had no luck using AWS DocumentDB).

## Possible improvements

- support UDP (might need a second LoadBalancer, depending on your cloud provider)
- support wireguard (requires UDP)
- fine tune resource requests and limits
- AWS only: switch to NLB instead of Classis LB
- HTTP and HTTPS could be handled by an Ingress

## Related resources

- https://github.com/goofball222/pritunl
- https://github.com/jippi/docker-pritunl
