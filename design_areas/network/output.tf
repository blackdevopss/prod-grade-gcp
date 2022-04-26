output "vpc_network_id" {
  value = tomap({
    for id, vpc in google_compute_network.vpc : id => {
      vpc_network_id = vpc.id
    }
  })
}
