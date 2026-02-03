terraform  {
    required_version  =  ">=  1.5.0"

    required_providers  {
        null  =  {
            source    =  "hashicorp/null"
            version  =  "~>  3.0"
        }
    }
}

#  This  is  a  placeholder  to  represent  on-prem  provisioning.
#  In  a  real  setup,  this  could  integrate  with  vSphere,  bare  metal,  or  an  existing  cluster.

resource  "null_resource"  "onprem_cluster"  {
    triggers  =  {
        env  =  var.env
    }
}
