resource "aws_security_group" "main" {
    name = var.sg_name
    description = var.sg_description
    vpc_id = var.vpc_id

    egress = {
        # Allow all outbound traffic
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # -1 means all protocols
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"] # Allow all IPv6 outbound traffic
    }

    tags = merge(
        var.sg_tags, # this allows other users to specify their own tags for the security group
        local.common_tags, # common tags defined in locals.tf
        {
            Name = "${var.project}-${var.environment}-${var.sg_name}" # Name of the security group roboshop-dev-frontend
        }
    )
  
}