
variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}


locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "Linux" {
  access_key    = "${var.aws_access_key}"
  ami_name      = "packer${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  secret_key    = "${var.aws_secret_key}"
  source_ami    = "ami-01216e7612243e0ef"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.Linux"]
}





export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""



locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "Linux" {
  ami_name      = "packer${local.timestamp}"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami    = "ami-01216e7612243e0ef"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.Linux"]
}

code usages
  mkdir tkpacker-demo
  ls
  cd tkpacker-demo/
  vi vars.pkr.hcl
  ls
  export AWS_ACCESS_KEY_ID="AKIA3G5L"
  export AWS_SECRET_ACCESS_KEY="hvhOyQOrLDZlJ3qql3bLVN"
  export AWS_DEFAULT_REGION="ap-south-1"
  packer build *
