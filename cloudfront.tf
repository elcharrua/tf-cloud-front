module "cloudfront" {
  source = "./modules/website-cloudfront"

  bucket_name                           = var.bucket_name
  cloudfront_aliases                    = var.cloudfront_aliases
  cdn_comment                           = var.cdn_comment
  certificate                           = var.certificate
  profile                               = var.profile
  region                                = var.region
  default_cache_behavior_cached_methods = var.default_cache_behavior_cached_methods
  tags                                  = var.tags
  bucket_versioning                     = var.bucket_versioning
}
