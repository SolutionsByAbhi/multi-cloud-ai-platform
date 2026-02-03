terraform  {
    required_version  =  ">=  1.5.0"

    required_providers  {
       aws  =  {
            source    =  "hashicorp/aws"
            version  =  "~>  5.0"
        }
    }

    backend  "s3"  {
        bucket                  =  "multi-cloud-ai-tfstate"
        key                        =  "aws/dev/terraform.tfstate"
        region                  =  "eu-central-1"
       dynamodb_table  =  "multi-cloud-ai-tf-locks"
        encrypt                =  true
    }
}

provider  "aws"  {
    region  =  var.region
}

locals  {
    name  =  "mcai-aws-${var.env}"
    tags  =  {
        Project          =  "multi-cloud-ai-platform"
        Environment  =  var.env
        Cloud              =  "aws"
    }
}

resource  "aws_eks_cluster"  "this"  {
   name          =  "${local.name}-eks"
    role_arn  =  var.eks_role_arn

    vpc_config  {
        subnet_ids  =  var.subnet_ids
    }

    tags  =  local.tags
}

resource  "aws_eks_node_group"  "gpu"  {
    cluster_name        =  aws_eks_cluster.this.name
    node_group_name  =  "${local.name}-gpu-ng"
    node_role_arn      =  var.node_role_arn
    subnet_ids            =  var.subnet_ids

    scaling_config  {
        desired_size  =  1
        max_size         =  3
        min_size          =  1
    }

    instance_types  =  ["g4dn.xlarge"]

    tags  =  local.tags
}
