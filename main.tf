resource "aws_cloudfront_cache_policy" "cloudfront_cache_policies" {
  for_each = var.cloudfront_cache_policies

  name        = each.value.name
  comment     = each.value.comment
  default_ttl = each.value.default_ttl
  max_ttl     = each.value.max_ttl
  min_ttl     = each.value.min_ttl

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = each.value.parameters_in_cache_key_and_forwarded_to_origin.cookies_config.cookie_behavior
      dynamic "cookies" {
        for_each = each.value.parameters_in_cache_key_and_forwarded_to_origin.cookies_config.cookies != null ? [each.value.parameters_in_cache_key_and_forwarded_to_origin.cookies_config.cookies] : []
        content {
          items = cookies.value.items
        }
      }
    }
    enable_accept_encoding_brotli = each.value.parameters_in_cache_key_and_forwarded_to_origin.enable_accept_encoding_brotli
    enable_accept_encoding_gzip   = each.value.parameters_in_cache_key_and_forwarded_to_origin.enable_accept_encoding_gzip
    headers_config {
      header_behavior = each.value.parameters_in_cache_key_and_forwarded_to_origin.headers_config.header_behavior
      dynamic "headers" {
        for_each = each.value.parameters_in_cache_key_and_forwarded_to_origin.headers_config.headers != null ? [each.value.parameters_in_cache_key_and_forwarded_to_origin.headers_config.headers] : []
        content {
          items = headers.value.items
        }
      }
    }
    query_strings_config {
      query_string_behavior = each.value.parameters_in_cache_key_and_forwarded_to_origin.query_strings_config.query_string_behavior
      dynamic "query_strings" {
        for_each = each.value.parameters_in_cache_key_and_forwarded_to_origin.query_strings_config.query_strings != null ? [each.value.parameters_in_cache_key_and_forwarded_to_origin.query_strings_config.query_strings] : []
        content {
          items = query_strings.value.items
        }
      }
    }
  }
}

