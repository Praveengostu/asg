# Configure the IBM Cloud Provider

resource "ibm_compute_ssh_key" "ssh_public_key_for_app-vms" {
  label      = "${var.ssh_label}"
  notes      = "${var.notes}"
  public_key = "${var.public_key}"
}

# Create a new virtual guest using image "UBUNTU_16_64"
resource "ibm_compute_vm_instance" "vm_instances" {
  hostname                 = "${var.hostname}"
  os_reference_code        = "${var.osref}"
  domain                   = "${var.domain}"
  datacenter               = "${var.datacenter}"
  network_speed            = "10"
  hourly_billing           = true
  private_network_only     = false
  cores                    = "1"
  memory                   = "1024"
  disks                    = ["25"]
  user_metadata            = "{\"value\":\"newvalue\"}"
  dedicated_acct_host_only = true
  post_install_script_uri  = "${var.vm-post-install-script-uri}"
  local_disk               = false
  ssh_key_ids              = ["${ibm_compute_ssh_key.ssh_public_key_for_app-vms.id}"]
}

resource "ibm_lbaas" "lbaas" {
  name        = "${var.name}"
  description = "lbaas example"
  subnets     = ["${var.subnet_id}"]

  protocols = [{
    frontend_protocol     = "HTTP"
    frontend_port         = 80
    backend_protocol      = "HTTP"
    backend_port          = 80
    load_balancing_method = "${var.lb_method}"
  }]
}

resource "ibm_lbaas_server_instance_attachment" "lbaas_member" {
  private_ip_address = "${ibm_compute_vm_instance.vm_instances.ipv4_address_private}"
  weight             = 40
  lbaas_id           = "${ibm_lbaas.lbaas.id}"
}

resource "ibm_lbaas_health_monitor" "lbaas_hm" {
  protocol   = "${ibm_lbaas.lbaas.health_monitors.0.protocol}"
  port       = "${ibm_lbaas.lbaas.health_monitors.0.port}"
  timeout    = 3
  lbaas_id   = "${ibm_lbaas.lbaas.id}"
  monitor_id = "${ibm_lbaas.lbaas.health_monitors.0.monitor_id}"
}
