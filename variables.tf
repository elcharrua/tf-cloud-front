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
