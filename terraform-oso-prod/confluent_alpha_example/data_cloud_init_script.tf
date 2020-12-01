data "template_file" "script" {
  template = file("${path.module}/scripts/startup.sh")
}