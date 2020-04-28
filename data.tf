
data "template_file" "container-defn-data" {
  template = "${file("${path.root}/${var.location_of_container_defn}")}"
  vars     = var.container-defn-placeholder-map
}
