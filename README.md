#  Multi-Cloud  AI  Inference  Platform  (AWS  +  Azure  +  On-Prem)

This  repository  implements  a  **Kubernetes-based  multi-cloud  AI  inference  platform**  spanning:

-  **AWS**  (EKS  +  GPU  node  group)
-  **Azure**  (AKS  +  GPU  node  pool)
-  **On-Prem**  (Kubernetes  cluster  with  GPU  nodes)

The  platform  is  designed  to  showcase  **Cloud  Solutions  Architect  +  AI**  skills:

-  Multi-cloud architecture  and  networking
-  GPU-based  model  serving  on  Kubernetes
-  Service  mesh  (Istio)  for  traffic  routing  and  failover
-  Vector  search  service  for  RAG-style  workloads
-  API  gateway  for  unified,  cloud-agnostic  access
-  Terraform-based  infrastructure  provisioning
-  GitOps-friendly  Kubernetes  manifests
-  CI/CD  pipelines  for  infra  and  app  deployments

---

##  High-level  architecture

-  **Infra  layer  (`infra/`)**
    -  Terraform  modules  for  AWS,  Azure,  and  On-Prem
    -  Creates  Kubernetes  clusters  (EKS,  AKS,  and  a  simulated  on-prem  cluster)
    -  Provisions  GPU  node groups/pools

-  **Platform  layer  (`k8s/`)**
    -  Base  namespaces,  Istio  gateway,  and  virtual  services
    -  Cloud-specific  GPU  node  configuration  and  overlays

-  **Application  layer  (`services/`)**
    -  `inference-service`:  FastAPI-based  LLM/ML  inference  API
    -  `vector-service`:  Vector  store  API  for  embeddings  and  similarity  search
    -  `api-gateway`:  Single  entrypoint  that  routes  to  inference  +  vector  services

-  **CI/CD  (`ci-cd/`)**
    -  GitHub  Actions  for  Terraform,  Docker  builds,  and  Kubernetes  deploys
    -  Kustomize  overlays  per  cloud

---

##  Core  capabilities

-  **Multi-cloud  routing**:  Istio  routes  traffic  to  the  nearest  healthy  cluster  (AWS,  Azure,  On-Prem).
-  **GPU-aware  scheduling**:  Inference  pods  request  GPU  resources  and  run  on  GPU  nodes.
-  **RAG-ready**:  Vector  service  stores  embeddings  and  supports  similarity  search.
-  **Unified  API**:  Clients  call  a  single  `/infer`  endpoint;  platform  decides  where/how  to  serve.
-  **Extensible**:  Swap  models,  add  clouds,  or  plug  in  managed  vector  DBs.

---

##  Getting  started  (high  level)

1.  **Provision  infra  per  cloud**

```bash
cd  infra/aws
terraform  init &&  terraform  apply  -var="env=dev"

cd  ../azure
terraform  init  &&  terraform  apply  -var="env=dev"

cd  ../onprem
terraform  init  &&  terraform  apply  -var="env=dev"
