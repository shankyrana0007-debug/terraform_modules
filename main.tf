# Dev Infrastructure
module "dev-infra" {
  source = "./modules/dev-infra"
  env = "dev"
  bucket_name = "infra-app-bucket-shashank-gwl"
  instance_count = 1
  instance_type = "t3.small"
  ec2_ami_id = "ami-0e5497a77ef21b5ac"
  hash_key = "studentID"
}

# Prd Infrastructure
module "prd-infra" {
  source = "./modules/dev-infra"
  env = "prd"
  bucket_name = "infra-app-bucket-shashank-gwl"
  instance_count = 1
  instance_type = "t3.small"
  ec2_ami_id = "ami-0e5497a77ef21b5ac"
  hash_key = "studentID"
}
# Stag Infrastructure
module "stag-infra" {
  source = "./modules/dev-infra"
  env = "stag"
  bucket_name = "infra-app-bucket-shashank-gwl"
  instance_count = 1
  instance_type = "t3.small"
  ec2_ami_id = "ami-0e5497a77ef21b5ac"
  hash_key = "studentID"
}

