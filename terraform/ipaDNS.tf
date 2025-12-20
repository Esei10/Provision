resource "freeipa_dns_record" "record-99" {
  zone_name = var.root_doamin
  name      = "kube-control-plane"
  records   = ["${var.kube_ip_prefix}.254"]
  type      = "A"
}
resource "freeipa_dns_record" "record-100" {
  zone_name = var.root_doamin
  name      = "kube-master1"
  records   = ["${var.kube_ip_prefix}.200"]
  type      = "A"
}
resource "freeipa_dns_record" "record-101" {
  zone_name = var.root_doamin
  name      = "kube-master2"
  records   = ["${var.kube_ip_prefix}.201"]
  type      = "A"
}
resource "freeipa_dns_record" "record-102" {
  zone_name = var.root_doamin
  name      = "kube-worker1"
  records   = ["${var.kube_ip_prefix}.202"]
  type      = "A"
}
resource "freeipa_dns_record" "record-103" {
  zone_name = var.root_doamin
  name      = "kube-worker2"
  records   = ["${var.kube_ip_prefix}.203"]
  type      = "A"
}
resource "freeipa_dns_record" "record-104" {
  zone_name = var.root_doamin
  name      = "kube-worker3"
  records   = ["${var.kube_ip_prefix}.204"]
  type      = "A"
}
resource "freeipa_dns_record" "record-105" {
  zone_name = var.root_doamin
  name      = "kube-worker4"
  records   = ["${var.kube_ip_prefix}.205"]
  type      = "A"
}

