variable  "env"  {
    type                =  string
    description  =  "Environment  name  (e.g.,  dev,  prod)"
}

variable  "region"  {
    type                =  string
    default          =  "eu-central-1"
}

variable  "eks_role_arn"  {
    type                =  string
    description  =  "IAM  role  ARN  for  EKS  cluster"
}

variable  "node_role_arn"  {
    type                =  string
    description  =  "IAM  role  ARN  for  EKS  node  group"
}

variable  "subnet_ids"  {
    type                =  list(string)
    description  =  "Subnet  IDs  for  EKS"
}
