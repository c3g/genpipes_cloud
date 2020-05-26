module "openstack" {
  source = "git::ssh://git@github.com:c3g/genpipes_cloud.git//openstack"


  # Slurm definition
  cluster_name        = "workshop_km"
  nb_nodes            = 7
  nb_users            = 50
  domain_name         = "brune" 
  shared_storage_size = 1000
  public_key_path     = "./cloud.pub"

  
  # ssh firewall allowed, comma separated
  fw_ssh_filter = "<my current ip>"
  

  # OpenStack specifics
  os_external_network = "external-network"
  os_image_id         = "7437fe81-af5d-490c-b29d-7a29f3244bfd"
  os_flavor_node      = "c8-40gb-180"
  os_flavor_login     = "p2-3gb"
  os_flavor_mgmt      = "p8-12gb"
}

output "public_ip" {
	value = "${module.openstack.ip}"
}

output "domain_name" {
	value = "${module.openstack.domain_name}"
}

output "admin_passwd" {
	value = "${module.openstack.admin_passwd}"
}

output "guest_passwd" {
	value = "${module.openstack.guest_passwd}"
}
