variable "custom_error_response" {
  description = "(Optional) List of custom error response configurations for cloudFront distribution."
  type = set(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
  default = [
    {
      error_code            = 403
      response_code         = 403
      response_page_path    = "/index.html"
      error_caching_min_ttl = 10
    }
  ]
}



variable "root_object" {
  type        = string
  default     = "/index.html"
  description = "The object that you want CloudFront to return (for example, index.html)"
}


variable "file_log" {
  type        = string
  default     = "transport-schedule"
  description = "CloudFront to prefix to the access log filenames for this distribution"
}

variable "price_class" {
  type        = string
  default     = "PriceClass_100"
  description = "The price class for this distribution"
}
variable "protocol_policy" {
  type        = string
  default     = "redirect-to-https"
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern."
}

variable "viewer_protocol_policy" {
  type        = string
  default     = "redirect-to-https"
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern."
}

variable "forward" {
  type        = string
  default     = "none"
  description = "Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify"
}

variable "cloudfront_origin_protocol_policy" {
  type        = string
  default     = "redirect-to-https"
  description = "The origin protocol policy to apply to your origin"
}

variable "cloudfront_origin_ssl_protocols" {
  type        = list(string)
  default     = ["TLSv1.2"]
  description = "he SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS"
}

variable "cloudfront_enabled" {
  type        = bool
  default     = true
  description = "A flag that specifies whether Origin Shield is enabled"
}

variable "clouldfront_is_ipv6_enabled" {
  type        = bool
  default     = true
  description = "Whether the IPv6 is enabled for the distribution"
}

variable "default_cache_behavior_allowed_methods" {
  type        = list(string)
  default     = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  description = "The default cache behavior for this distribution"
}

variable "default_cache_behavior_min_ttl" {
  type        = number
  default     = 0
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated"
}

variable "default_cache_behavior_default_ttl" {
  type        = number
  default     = 3600
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
}

variable "default_cache_behavior_max_ttl" {
  type        = number
  default     = 86400
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated."
}

variable "ordered_cache_behavior_allowed_methods" {
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
  description = "The ordered cache behavior for this distribution"
}

variable "ordered_cache_behavior_cached_methods" {
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods"
}

variable "ordered_cache_behavior_min_ttl" {
  type        = number
  default     = 0
  description = "The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated"
}

variable "ordered_cache_behavior_default_ttl" {
  type        = number
  default     = 86400
  description = "The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header."
}

variable "ordered_cache_behavior_max_ttl" {
  type        = number
  default     = 31536000
  description = "The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated."
}

variable "certificate_minimum_protocol_version" {
  type        = string
  description = "The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
  default     = "TLSv1.2_2021"
}

###### requires #######

variable "default_cache_behavior_cached_methods" {
  type        = list(string)
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied on cloudfront resources"
}


variable "cloudfront_aliases" {
  type        = list(string)
  description = "Alternate domain name for cloudfront "
}

variable "bucket_name" {
  type        = string
  description = "Bucket name used for cloudfront"
}
variable "bucket_acl" {
  type        = string
  default     = "private"
  description = "Bucket ACL (more info link: https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl)"
}
variable "certificate" {
  type        = string
  description = "Certificate environment "
}

variable "region" {
  type        = string
  description = "Region account"
}

variable "profile" {
  type        = string
  description = "Profile account"
}

variable "bucket_versioning" {
  type        = string
  description = "Versioning the bucket default=false"
}

variable "cdn_comment" {
  type = string
}

variable "headers" {
  type        = list(string)
  description = "Cache key and origin requests"
  default     = ["Origin", "Access-Control-Request-Method", "Acces-Control-Request-Headers"]
}
