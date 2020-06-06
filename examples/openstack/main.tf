module "openstack" {
  source = "git::https://github.com/c3g/genpipes_cloud.git/openstack"


  # Slurm definition
  cluster_name        = "workshop_km"
  nb_nodes            = 3
  nb_users            = 10
  domain_name         = "brune"
  shared_storage_size = 30
  home_fs_size        = 10
  public_key_path     = "./cloud.pub"


  # ssh firewall allowed - list (e.g. ["103.212.144.89/32","106.223.123.174/32"])
  fw_ssh_filter = [] # get with curl ifconfig.co


  # OpenStack specifics
  os_external_network = "net04_ext"
  os_image_id         = "69371290-3281-4951-b688-4d4ab166ae60" # CentOS-7-x64-2020-03
  os_flavor_node      = "c2-3.75gb-92"
  os_flavor_login     = "p1-0.75gb"
  os_flavor_mgmt      = "p4-4gb"
}

output "public_ip" {
	value = module.openstack.ip
}

output "domain_name" {
	value = module.openstack.domain_name
}

output "admin_passwd" {
	value = module.openstack.admin_passwd
}

output "guest_passwd" {
	value = module.openstack.guest_passwd
}
