

locals {
   
server_tags = "${merge(var.tags,map("OS",var.OS))}"



}
