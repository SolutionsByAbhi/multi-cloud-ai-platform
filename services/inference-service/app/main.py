from  fastapi  import  FastAPI
from  pydantic  import  BaseModel
from  model_server  import  run_inference

app  =  FastAPI(title="Inference  Service",  version="0.1.0")


class  InferenceRequest(BaseModel):
        prompt:  str


class  InferenceResponse(BaseModel):
        output:  str


@app.post("/infer",  response_model=InferenceResponse)
async  def  infer(request:  InferenceRequest):
        result  =  run_inference(request.dict())
        return  InferenceResponse(**result)
