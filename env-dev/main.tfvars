env = "dev"
vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      public = {
        name       = "public"
        cidr_block = ["10.0.0.0/24", "10.0.1.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
      web = {
        name       = "web"
        cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
      app = {
        name       = "app"
        cidr_block = ["10.0.4.0/24", "10.0.5.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
      db = {
        name       = "db"
        cidr_block = ["10.0.6.0/24", "10.0.7.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
    }
  }
}

app = {
  frontend ={
    name = "frontend"
    instant_type = "t3.small"
    subnet_name = "web"
  }
  catalogue ={
    name = "catalogue"
    instant_type = "t3.small"
    subnet_name = "web"
  }
  cart ={
    name = "cart"
    instant_type = "t3.small"
    subnet_name = "web"
  }
  user ={
    name = "user"
    instant_type = "t3.small"
    subnet_name = "web"
  }
  shipping ={
    name = "shipping"
    instant_type = "t3.small"
    subnet_name = "web"
  }
  payment ={
    name = "payment"
    instant_type = "t3.small"
    subnet_name = "web"
  }
}