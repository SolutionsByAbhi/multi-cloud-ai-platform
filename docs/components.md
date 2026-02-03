#  Components

##  Inference  Service

-  FastAPI-based  microservice
-  Exposes  `/infer`  endpoint
-  Loads  a  model  (placeholder  in  this  repo;  can  be  wired  to  HuggingFace,  Triton,  or  TGI)
-  Requests  GPU  resources  via  Kubernetes  resource  requests/limits

##  Vector  Service

-  FastAPI-based  microservice
-  Exposes:
   -  `POST  /embed`  –  store  embeddings
    -  `POST  /search`  –  similarity  search
-  Uses  in-memory  store  by  default;  can  be  swapped  for  Qdrant/OpenSearch.

##  API  Gateway

-  FastAPI-based  microservice
-  Exposes:
    -  `POST  /infer`  –  orchestrates:
        -  optional  vector  search
        -  call  to  inference  service
-  Acts  as  a  single  entrypoint  for  clients.

##  Istio

-  Provides:
    -  Ingress  gateway
    -  VirtualServices  for  routing
    - Potential  for  multi-cluster  mesh  (conceptually  represented  here)
