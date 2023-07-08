resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "access-identity-${aws_s3_bucket.bucket_s3.bucket_domain_name}"
}
resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket_s3.bucket_regional_domain_name
    origin_id   = var.bucket_name
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path

    }
  }
  enabled             = var.cloudfront_enabled
  is_ipv6_enabled     = var.clouldfront_is_ipv6_enabled
  comment             = var.cdn_comment
  default_root_object = var.root_object
  logging_config {
    include_cookies = false
    bucket          = aws_s3_bucket.bucket_s3.bucket_regional_domain_name
    prefix          = var.file_log
  }
  aliases = var.cloudfront_aliases
  default_cache_behavior {
    allowed_methods = var.default_cache_behavior_allowed_methods
    cached_methods  = var.default_cache_behavior_cached_methods

    target_origin_id = var.bucket_name
    forwarded_values {
      headers      = var.headers
      query_string = false
      cookies {
        forward = var.forward
      }
    }
    viewer_protocol_policy = var.viewer_protocol_policy
    min_ttl                = var.default_cache_behavior_min_ttl
    default_ttl            = var.default_cache_behavior_default_ttl
    max_ttl                = var.default_cache_behavior_max_ttl
  }

  price_class = var.price_class
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  tags = var.tags

  viewer_certificate {
    acm_certificate_arn            = var.certificate
    minimum_protocol_version       = var.certificate_minimum_protocol_version
    cloudfront_default_certificate = false
    ssl_support_method             = "sni-only"
  }
  dynamic "custom_error_response" {
    for_each = var.custom_error_response
    content {
      error_code            = custom_error_response.value.error_code
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
    }
  }

  depends_on = [
    aws_s3_bucket.bucket_s3
  ]
}
