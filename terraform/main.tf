module "yandex_instance_1" {
  source                = "./modules/create_vm"
  disk_size             = "40"
  cores                 = "2"
  memory                = "2"
  instance_family_image = "centos-7"
  instance_subnet_name  = "a-ru-central1-a"
  instance_name         = "vm01"
  zone_name             = "ru-central1-a"
}
