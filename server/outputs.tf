output "key_pair_private_key_pem" {
    description = "The private key in PEM format"
    sensitive = true
    value = tls_private_key.this.private_key_pem
}