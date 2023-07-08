# transport-scheduler

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.s3_distribution](https://registry.terraform.io/providers/hashicorp/aws/4.15.0/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.origin_access_identity](https://registry.terraform.io/providers/hashicorp/aws/4.15.0/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/4.15.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_policy.allow_bucket_cloudfront](https://registry.terraform.io/providers/hashicorp/aws/4.15.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.bucket_block_s3](https://registry.terraform.io/providers/hashicorp/aws/4.15.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket.bucket_s3](https://registry.terraform.io/providers/hashicorp/aws/4.15.0/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_acl"></a> [bucket\_acl](#input\_bucket\_acl) | Bucket ACL (more info link: https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html#canned-acl) | `string` | `"private"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Bucket name used for cloudfront | `string` | n/a | yes |
| <a name="input_certificate"></a> [certificate](#input\_certificate) | Certificate environment | `string` | n/a | yes |
| <a name="input_certificate_minimum_protocol_version"></a> [certificate\_minimum\_protocol\_version](#input\_certificate\_minimum\_protocol\_version) | The minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections. | `string` | `"TLSv1.2_2021"` | no |
| <a name="input_cloudfront_aliases"></a> [cloudfront\_aliases](#input\_cloudfront\_aliases) | Alternate domain name for cloudfront | `list(string)` | n/a | yes |
| <a name="input_cloudfront_enabled"></a> [cloudfront\_enabled](#input\_cloudfront\_enabled) | A flag that specifies whether Origin Shield is enabled | `bool` | `true` | no |
| <a name="input_cloudfront_origin_protocol_policy"></a> [cloudfront\_origin\_protocol\_policy](#input\_cloudfront\_origin\_protocol\_policy) | The origin protocol policy to apply to your origin | `string` | `"http-only"` | no |
| <a name="input_cloudfront_origin_ssl_protocols"></a> [cloudfront\_origin\_ssl\_protocols](#input\_cloudfront\_origin\_ssl\_protocols) | he SSL/TLS protocols that you want CloudFront to use when communicating with your origin over HTTPS | `list(string)` | <pre>[<br>  "TLSv1.2"<br>]</pre> | no |
| <a name="input_clouldfront_is_ipv6_enabled"></a> [clouldfront\_is\_ipv6\_enabled](#input\_clouldfront\_is\_ipv6\_enabled) | Whether the IPv6 is enabled for the distribution | `bool` | `true` | no |
| <a name="input_custom_error_response"></a> [custom\_error\_response](#input\_custom\_error\_response) | (Optional) List of custom error response configurations for cloudFront distribution. | <pre>set(object({<br>    error_code            = number<br>    response_code         = number<br>    response_page_path    = string<br>    error_caching_min_ttl = number<br>  }))</pre> | <pre>[<br>  {<br>    "error_caching_min_ttl": 10,<br>    "error_code": 403,<br>    "response_code": 403,<br>    "response_page_path": "/index.html"<br>  }<br>]</pre> | no |
| <a name="input_default_cache_behavior_allowed_methods"></a> [default\_cache\_behavior\_allowed\_methods](#input\_default\_cache\_behavior\_allowed\_methods) | The default cache behavior for this distribution | `list(string)` | <pre>[<br>  "DELETE",<br>  "GET",<br>  "HEAD",<br>  "OPTIONS",<br>  "PATCH",<br>  "POST",<br>  "PUT"<br>]</pre> | no |
| <a name="input_default_cache_behavior_cached_methods"></a> [default\_cache\_behavior\_cached\_methods](#input\_default\_cache\_behavior\_cached\_methods) | Controls whether CloudFront caches the response to requests using the specified HTTP methods | `list(string)` | n/a | yes |
| <a name="input_default_cache_behavior_default_ttl"></a> [default\_cache\_behavior\_default\_ttl](#input\_default\_cache\_behavior\_default\_ttl) | The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. | `number` | `3600` | no |
| <a name="input_default_cache_behavior_max_ttl"></a> [default\_cache\_behavior\_max\_ttl](#input\_default\_cache\_behavior\_max\_ttl) | The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. | `number` | `86400` | no |
| <a name="input_default_cache_behavior_min_ttl"></a> [default\_cache\_behavior\_min\_ttl](#input\_default\_cache\_behavior\_min\_ttl) | The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated | `number` | `0` | no |
| <a name="input_file_log"></a> [file\_log](#input\_file\_log) | CloudFront to prefix to the access log filenames for this distribution | `string` | `"transport-schedule"` | no |
| <a name="input_forward"></a> [forward](#input\_forward) | Specifies whether you want CloudFront to forward cookies to the origin that is associated with this cache behavior. You can specify | `string` | `"none"` | no |
| <a name="input_ordered_cache_behavior_allowed_methods"></a> [ordered\_cache\_behavior\_allowed\_methods](#input\_ordered\_cache\_behavior\_allowed\_methods) | The ordered cache behavior for this distribution | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD",<br>  "OPTIONS"<br>]</pre> | no |
| <a name="input_ordered_cache_behavior_cached_methods"></a> [ordered\_cache\_behavior\_cached\_methods](#input\_ordered\_cache\_behavior\_cached\_methods) | Controls whether CloudFront caches the response to requests using the specified HTTP methods | `list(string)` | <pre>[<br>  "GET",<br>  "HEAD",<br>  "OPTIONS"<br>]</pre> | no |
| <a name="input_ordered_cache_behavior_default_ttl"></a> [ordered\_cache\_behavior\_default\_ttl](#input\_ordered\_cache\_behavior\_default\_ttl) | The default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an Cache-Control max-age or Expires header. | `number` | `86400` | no |
| <a name="input_ordered_cache_behavior_max_ttl"></a> [ordered\_cache\_behavior\_max\_ttl](#input\_ordered\_cache\_behavior\_max\_ttl) | The maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated. | `number` | `31536000` | no |
| <a name="input_ordered_cache_behavior_min_ttl"></a> [ordered\_cache\_behavior\_min\_ttl](#input\_ordered\_cache\_behavior\_min\_ttl) | The minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated | `number` | `0` | no |
| <a name="input_price_class"></a> [price\_class](#input\_price\_class) | The price class for this distribution | `string` | `"PriceClass_100"` | no |
| <a name="input_profile"></a> [profile](#input\_profile) | Profile account | `string` | n/a | yes |
| <a name="input_protocol_policy"></a> [protocol\_policy](#input\_protocol\_policy) | Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. | `string` | `"redirect-to-https"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region account | `string` | n/a | yes |
| <a name="input_root_object"></a> [root\_object](#input\_root\_object) | The object that you want CloudFront to return (for example, index.html) | `string` | `"index.html"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied on cloudfront resources | `map(string)` | n/a | yes |
| <a name="input_viewer_protocol_policy"></a> [viewer\_protocol\_policy](#input\_viewer\_protocol\_policy) | Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern. | `string` | `"allow-all"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
