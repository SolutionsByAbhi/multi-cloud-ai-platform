from  fastapi  import  FastAPI
from  pydantic  import  BaseModel
import httpx
import  os

INFERENCE_URL  =  os.getenv("INFERENCE_URL",  "http://inference-service.ai-platform.svc.cluster.local/infer")
VECTOR_URL  =  os.getenv("VECTOR_URL",  "http://vector-service.ai-platform.svc.cluster.local")

app  =  FastAPI(title="API  Gateway",  version="0.1.0")


class  InferRequest(BaseModel):
        prompt:  str
        use_vector:  bool  =  False


@app.post("/infer")
async  def  infer(req:  InferRequest):
        async  with  httpx.AsyncClient()  as  client:
                if  req.use_vector:
                        #  Example:  call  vector  service  first  (placeholder  logic)
                       await  client.post(f"{VECTOR_URL}/embed",  json={"vector":  [0.1,  0.2,  0.3],  "payload":  req.prompt})

                resp  =  await  client.post(INFERENCE_URL,  json={"prompt":  req.prompt})
                resp.raise_for_status()
                return  resp.json()
