output "mysystem_ip" {
  value = "${chomp(data.http.icanhazip.response_body)}/32"
}

