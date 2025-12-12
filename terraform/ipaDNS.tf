resource "freeipa_dns_record" "record-99" {
  zone_name = "home.agent-est.com"
  name      = "kube-control-plane"
  records   = ["192.168.105.9"]
  type      = "A"
}
resource "freeipa_dns_record" "record-100" {
  zone_name = "home.agent-est.com"
  name      = "kube-master1"
  records   = ["192.168.105.200"]
  type      = "A"
}
resource "freeipa_dns_record" "record-101" {
  zone_name = "home.agent-est.com"
  name      = "kube-master2"
  records   = ["192.168.105.201"]
  type      = "A"
}
resource "freeipa_dns_record" "record-102" {
  zone_name = "home.agent-est.com"
  name      = "kube-worker1"
  records   = ["192.168.105.202"]
  type      = "A"
}
resource "freeipa_dns_record" "record-103" {
  zone_name = "home.agent-est.com"
  name      = "kube-worker2"
  records   = ["192.168.105.203"]
  type      = "A"
}
resource "freeipa_dns_record" "record-104" {
  zone_name = "home.agent-est.com"
  name      = "kube-worker3"
  records   = ["192.168.105.204"]
  type      = "A"
}
resource "freeipa_dns_record" "record-105" {
  zone_name = "home.agent-est.com"
  name      = "kube-worker4"
  records   = ["192.168.105.205"]
  type      = "A"
}

