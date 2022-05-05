resource "random_password" "vpn" {
  count  = 2
  length = 8
}

# MongoDB
# https://artifacthub.io/packages/helm/bitnami/mongodb/12.0.0#parameters
resource "helm_release" "mongodb" {
  name       = "mongodb"
  chart      = "mongodb"
  repository = "https://charts.bitnami.com/bitnami"
  version    = "12.0.0"

  # ... other settings ...

  values = [
    yamlencode({
      auth : {
        rootUser : "root"
        rootPassword : random_password.vpn[0].result
        usernames : ["pritunl"]
        passwords : [random_password.vpn[1].result]
        databases : ["pritunl"]
      }
  })]
}

# pritunl - VPN Server
resource "helm_release" "pritunl" {
  name            = "pritunl"
  chart           = "../"
  version         = "1.0.0"
  
  # ... other settings ...

  values = [
    yamlencode({
      name: "pritunl"
      image: "jippi/pritunl:1.30.3153.83-minimal"
      mongodbUri: "mongodb://pritunl:${random_password.vpn[1].result}@mongodb-headless/pritunl?authSource=admin&replicaSet=rs0"
      externalDns: {
        enabled: true
        hostname: "my-vpn.my-domain.tld"
      }
  })]

  depends_on = [helm_release.mongodb]
}
