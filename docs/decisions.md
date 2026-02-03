#  Architecture  Decisions

##  Kubernetes  as  the  core  abstraction

Kubernetes  is  used  as  the  common  runtime  across  AWS,  Azure,  and  On-Prem  to  provide  a  consistent  deployment  and  operations  model.

##  Istio  for  service  mesh

Istio  is  chosen  for:
-  Traffic  routing
-  mTLS  (not  fully  configured  in  this  demo)
-  Extensibility  to  multi-cluster  meshes

##  Simple  model  server

The  inference  service  uses  a  simple  Python-based  model  server to  keep  the  repo  self-contained.  In  a  real  deployment,  this  would  be  replaced  with:
-  Triton  Inference  Server
-  HuggingFace  TGI
-  Ray  Serve
-  Or  a  managed  service.

##  Vector  store  abstraction

The  vector  service  uses  an  in-memory  store  to  demonstrate  the  API  and  integration  pattern.  This  can  be  swapped  for:
-  Qdrant
-  Pinecone
-  OpenSearch
-  Azure  Cognitive  Search
