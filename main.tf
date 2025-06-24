resource "aws_security_group" "main" {
    name = var.sg_name
    description = var.sg_description
    vpc_id = var.vpc_id

    tags = merge(
        var.sg_tags, # this allows other users to specify their own tags for the security group
        local.common_tags, # common tags defined in locals.tf
        {
            Name = "${var.project}-${var.environment}-${var.sg_name}" # Name of the security group roboshop-dev-frontend
        }
    )
  
}