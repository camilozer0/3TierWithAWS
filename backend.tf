terraform {
  backend "s3" {
    bucket       = "camilozer0terraformlabs"
    key          = "terraform/backend/threetierwithaws/statefile.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
