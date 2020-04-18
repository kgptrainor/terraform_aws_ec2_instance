output "id" {
  description = "List of IDs of instances"
  value       = "${aws_instance.new_ec2instance.*.id}"

}

output "private_ip" {
  description = "IP Address of EC2 Instance"
    value       = "${aws_instance.new_ec2instance.*.private_ip}"
  }

output "private_dns" {
  description = "DNS internal name of EC2 Instance"
  value       = "${aws_instance.new_ec2instance.*.private_dns}"
}

output "public_ip" {
  description = "Public IP Address of EC2 Instance"
  value       = "${aws_instance.new_ec2instance.*.public_ip}"
}

output "publicname" {
  description = "Public DNS name of EC2 Instance"
  value       = "${aws_instance.new_ec2instance.*.public_dns}"
}

output "availability_zone" {
  description = "availability_zoneEC2 Instance"
    value       = "${aws_instance.new_ec2instance.*.availability_zone}"
  }

  output "aws_eip" {
  description = "availability_zoneEC2 Instance"
    value       = "${aws_eip.ec2_eip.*.public_ip}"
  }


#file("${path.module}/secrets/gsa-seismic-ec2.pem"

output "Administrator_Password" {
  value = [
    for i in aws_instance.new_ec2instance : rsadecrypt(i.password_data, file(var.ssh_priv_key))
  ]
}
