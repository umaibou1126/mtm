# ====================
# ACM
# ====================
resource "aws_acm_certificate" "terraform-acm" {
  domain_name               = "XXX.com"
  subject_alternative_names = ["*.XXX.com"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
