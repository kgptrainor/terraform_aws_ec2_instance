resource "aws_eip_association" "eip_assoc" { 
  count         = var.assign_elastic_ip_address == true ?  var.instance_count : 0 
  instance_id   = element(aws_instance.new_ec2instance.*.id, count.index)
  allocation_id = element(aws_eip.ec2_eip.*.id, count.index)
}


resource "aws_eip" "ec2_eip" {
 count         = var.assign_elastic_ip_address == true ? var.instance_count : 0 
 vpc = true
}