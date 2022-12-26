terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.82.0"
    }
  }

  required_version = ">= 0.13"

  # Настройка доступа к S3 внешнему хранилищу State-файла

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "test-bucket-esm"
    region   = "ru-central1-a"
    key      = "tf/b9-proj.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}


