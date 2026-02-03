variable  "env"  {
    type                =  string
    description  =  "Environment  name"
}

variable  "location"  {
   type                =  string
    default          =  "westeurope"
}

variable  "resource_group_name"  {
    type                =  string
    description  =  "Resource  group  for  AKS"
}
