variable "public_key" {
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDsy6xezIOMHBqCce2yQwPAh5BHfBg0SCpNjyPmXuOuePgYFjqYf4ovT4IM4tU0pO0pY40+4HfxLjVWC2vVf6qzwkvEkqQtijjC5xaiBD3ygFy/bD0C8wC1HIFkm2wl7IipvgWbRetniwV9SgjlAVVNzXJmuRwoVQ/ywt1P115rOcO85kJGdRDPp3IReJZJ/UxzSRK60/1j0cBAi4V/GYqYFt99FHCtTvdtZoyYeSgp450oR/5s3Skb96vVKWxcP+G6ZMRSMwbAsY3Pi/9u8cOU6Qf6Mn23OIz7W7UCV7wh3zBpzHlZ3Rmo3hSmdQNX7Z8fSNKYu4EXN4QKqtp0XitQewdt3lTuLVeYAjNi9bnD+ATAo7GDy/Gd9QrYj5t6V1AF6zTmAfoLR8dJFaiZ2zmZwCugLPYlx6gDTww26DjEN4ZK/nCLvRwWA+s4fP6XZhzXHVPi7pL5JiwcF4a1ym0IIURgye25fS39HQGQoZprlDZv2TPjoLaVHatxS87+MUp8Fa/O9Qi8+xM7Aw+NsEu3NQDen6Q6vruFPYvchJ9GQcYbdmvGTd//JC9bY6W5Djf3EZTg1WCx0l4I8hiWRb6z/aZQK00GVDt+esPIU6yC/O2TX69WcZPZjMRKdBpaC8cF7aJHeBUo+UH1NxrFXqLeg44kZ5bIkogHgJkwgzUilw== praveek9@in.ibm.com"
  description = "public SSH key to use in keypair"
}

variable "ssh_label" {
  default = "ssh_lbaas"
}

variable name {
  default = "terraformLbaasExample"
}

variable notes {
  default = "for lbaas test"
}

variable osref {
  default = "UBUNTU_16_64"
}

variable domain {
  default = "ibm.com"
}

variable lb_method {
  default = "round_robin"
}

variable subnet_id {
  default = "1395071"
}

variable datacenter {
  default = "mex01"
}

variable "vm-post-install-script-uri" {
  default = "https://raw.githubusercontent.com/hkantare/test/master/nginx.sh"
}

variable hostname {
  default = "lbaas-example"
}
