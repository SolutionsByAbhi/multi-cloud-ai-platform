
---

##  `docs/architecture-overview.md`

```markdown
#  Architecture  Overview

The  Multi-Cloud  AI  Inference  Platform  is  built  around  three  layers:

1.  **Infrastructure  Layer  (`infra/`)**
      -  Provisions  Kubernetes  clusters  in:
          -  AWS  (EKS)
          -  Azure  (AKS)
          -  On-Prem  (simulated  via  Terraform  +  kubeadm  or an  existing  cluster)
      -  Configures  GPU  node  groups/pools  for  inference  workloads.

2.  **Platform  Layer  (`k8s/`)**
      -  Installs:
          -  Namespaces
          -  Istio  ingress  gateway
          -  VirtualServices  for  routing
      -  Provides  cloud-specific  overlays  for  GPU  nodes  and  configuration.

3.  **Application  Layer  (`services/`)**
      -  `inference-service`:  serves  models  via  FastAPI.
      -  `vector-service`:  stores  and  queries  embeddings.
      - `api-gateway`:  exposes  a  unified  API  and  orchestrates  calls  to  inference  +  vector.

Traffic  flow:

Client  →  Istio  Gateway  →  API  Gateway  →  Inference  Service  (+  Vector  Service)  →  Response
