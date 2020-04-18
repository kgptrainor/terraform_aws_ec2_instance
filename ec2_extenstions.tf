
data "template_file" "rename_computer" {
  template = "${file("${path.module}/include/rename_computer.tmpl")}"
}

data "template_file" "linux_rename_computer" {
  template = "${file("${path.module}/include/linux_rename_computer.tmpl")}"
}