# ====================
# ACM
# ====================
#resource "aws_acm_certificate" "terraform-acm" {
#  domain_name               = "portfoliough.com"
#  subject_alternative_names = ["*.portfoliough.com"]
#  validation_method         = "DNS"

#  lifecycle {
#    create_before_destroy = true
#  }
#}
