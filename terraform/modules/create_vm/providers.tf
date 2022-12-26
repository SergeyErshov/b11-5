terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.82.0"
    }
  }

  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = file("~/authorized_key.json")
  cloud_id                 = "b1ga0bs8pioqsr6ck6kk"
  folder_id                = "b1gb2sfmo75im8haari2"
  zone                     = "ru-central1-a"
}

