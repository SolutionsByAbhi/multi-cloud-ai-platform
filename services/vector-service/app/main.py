from  typing  import  List
from  fastapi  import  FastAPI
from  pydantic  import  BaseModel
from  store  import  store

app  =  FastAPI(title="Vector  Service",  version="0.1.0")


class  EmbedRequest(BaseModel):
   vector:  List[float]
    payload:  str


class  SearchRequest(BaseModel):
    vector:  List[float]
    top_k:  int  =  3


@app.post("/embed")
async  def  embed(req:  EmbedRequest):
    store.add(req.vector,  req.payload)
    return  {"status":  "ok"}


@app.post("/search")
async  def  search(req:  SearchRequest):
    results  =  store.search(req.vector,  req.top_k)
    return  {"results":  [{"payload":  p,  "score":  s}  for  p,  s  in  results]}
