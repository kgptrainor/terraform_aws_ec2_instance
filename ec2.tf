data "aws_ami" "instance_ami" {
  most_recent = true
  owners      = ["self", "amazon", "aws-marketplace"]

  filter {
    name   = "name"
    values = ["${var.ami_name}*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "new_ec2instance" {
  count                       = var.instance_count
  ami                         = data.aws_ami.instance_ami.id
  instance_type               = var.instance_type
  monitoring                  = var.monitoring
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  disable_api_termination     = var.disable_api_termination
  iam_instance_profile        = "EC2SSMProfileRole"
  key_name                    = var.key_name
  user_data                   = "<powershell>${data.template_file.rename_computer.rendered}</powershell><persist>true</persist>"  
  tags                        = merge(local.server_tags,map("Name","${var.instance_count == 1 ? "${var.computer_name}":"${var.computer_name}${count.index + 1}"}"))
  volume_tags                 = merge(var.volume_tags,map("Name","${var.instance_count == 1 ? "${var.computer_name}":"${var.computer_name}${count.index + 1}"}"))
  get_password_data           = true
  
 
  dynamic "root_block_device" {
    for_each = var.root_block_device
      content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = lookup(ephemeral_block_device.value, "no_device", null)
      virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
    }
  }
  

}



