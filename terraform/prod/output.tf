output "data_aws_ami_mane" {
  value = data.aws_ami.latest_amazon_linux.name
}

output "web_loadbalancer_url" {
  value = aws_elb.web.dns_name
}
