output "account_id" {
  value = data.aws_caller_identity.current_account_info.account_id

}

#  networking
output "NETWORK-vpc_id" {
  value = module.networking.vpc.id
}

output "NETWORK-elastic-ip-addr" {
  value = module.networking.elastic-ip-addr
}

output "NETWORK-IGW-id" {
  value = module.networking.IGW-id
}


output "NETWORK-NGW-id" {
  value = module.networking.NGW-id
}
