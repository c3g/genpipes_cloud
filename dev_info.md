
#Overview
There are three different machines on the cluster:

node.X : to compute  
login01: to connect from the Web  
mgmt01: to control all useful services/servers
 (freeipa, zfs, cvmfs, squid, slurm...)  


There are two parts to our system the deployment with terraform which has a
different flavor for all the cloud we want to deploy to and the provision part
which install software on the three different machine. The former part
should be independent on of the cloud provider.

# tips

* This deployment should work with terraform 11.11. It cashed with 12.XX
https://releases.hashicorp.com/terraform/

* Once the `terraform apply` was succesful, problems will arise because the mgmt01
node has hit deployment problems.

* Do not forget to make your main.tf file point to the repo you have cloned on
your machine.
```
module "openstack" {
  source = "/PATH/TO/genpipes_cloud/openstack"
  [...]
```
