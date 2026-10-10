variable "cloudfront_cache_policies" {
  description = <<EOT
Map of cloudfront_cache_policies, attributes below
Required:
    - name
    - parameters_in_cache_key_and_forwarded_to_origin (block):
        - cookies_config (required, block):
            - cookie_behavior (required)
            - cookies (optional, block):
                - items (optional)
        - enable_accept_encoding_brotli (optional)
        - enable_accept_encoding_gzip (optional)
        - headers_config (required, block):
            - header_behavior (optional)
            - headers (optional, block):
                - items (optional)
        - query_strings_config (required, block):
            - query_string_behavior (required)
            - query_strings (optional, block):
                - items (optional)
Optional:
    - comment
    - default_ttl
    - max_ttl
    - min_ttl
EOT

  type = map(object({
    name        = string
    comment     = optional(string)
    default_ttl = optional(number)
    max_ttl     = optional(number)
    min_ttl     = optional(number)
    parameters_in_cache_key_and_forwarded_to_origin = object({
      cookies_config = object({
        cookie_behavior = string
        cookies = optional(object({
          items = optional(set(string))
        }))
      })
      enable_accept_encoding_brotli = optional(bool)
      enable_accept_encoding_gzip   = optional(bool)
      headers_config = object({
        header_behavior = optional(string)
        headers = optional(object({
          items = optional(set(string))
        }))
      })
      query_strings_config = object({
        query_string_behavior = string
        query_strings = optional(object({
          items = optional(set(string))
        }))
      })
    })
  }))
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

