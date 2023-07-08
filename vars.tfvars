bucket_name        = "bucket_name
bucket_versioning  = "Enabled"
cloudfront_aliases = ["alias.com.br"]
certificate        = "arn:aws:acm:"
cdn_comment        = "bucket-name"
profile            = ""
region             = "us-east-1"

default_cache_behavior_cached_methods = ["GET", "HEAD"]

###### tags #######
tags = {
  system                   = "devops"
  application              = "cloudfront"

}
