
##########  EC2 - Details ##########

variable "instance_type" {
  description = "The instance_type"
}

variable "key_name" {
  description = "The instance_type"
}


variable "ami_name" {
  description = "ami_name"
}


variable "vpc_id" {
  description = "vpc_id"
 }

variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"

 }


 

variable "assign_elastic_ip_address" {
  description = "assign_elastic_ip_address"
  default     = false
}



variable "os_type" {
  description = "linux or windows"

}

variable "instance_count" {
  description = "instance_count"
  default = 1 
}


variable "size" {
  description = "size"
  default     = {}
}



variable "root_volume_size" {
  description = "root_volume_size"
  default = {}
}

variable "pubkeydata" {
  description = "SSH Public key data for AWS EC2 key pair usage"
  default = {}
}


variable "subnet_id" {
  description = "subnet_id"
    
    }


variable "disable_api_termination" {
  description = "disable_api_termination"
 }

variable "associate_public_ip_address" {
  description = "associate_public_ip_address"
 }

 
##########  EC2 - Tags ##########

variable "tags" {
  description = "tags"
}
variable "volume_tags" {
  description = "tags"
}
variable "OS" {
  description = "OS tag"
}
variable "computer_name" {
  description = "computer_name"
}

variable "application_name" {
  description = "application_name"
}



#####
variable "ebs_optimized" {
  type        = string
  description = "Enable EBS Optimized"
  default     = "false"
}

variable "monitoring" {
  type        = bool
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "user_data" {
  type        = string
  description = "The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  default     = null
}



##################
variable "root_device_backup_tag" {
  type        = string
  description = "EC2 Root Block Device backup tag"
  default     = "True"
}

variable "root_block_device" {
  type        = list(map(string))
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  default     = []
}

variable "ebs_block_device" {
  type        = list(map(string))
  description = "Additional EBS block devices to attach to the instance"
  default     = []
}

variable "ephemeral_block_device" {
  type        = list(map(string))
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
default     = []
}



variable "ssh_priv_key" {
  description = "ssh_priv_key tag"
 
}


