from  typing  import  Dict

#  Placeholder  "model"  –  in  a  real  system,  load  a  transformer  or  other  ML  model  here.
class  SimpleModel:
        def  __init__(self)  ->  None:
                self.name  =  "simple-echo-model"

        def  infer(self,  prompt:  str)  ->  str:
                return  f"[{self.name}]  Response  to:  {prompt}"


model  =  SimpleModel()


def  run_inference(payload:  Dict)  ->  Dict:
        prompt  =  payload.get("prompt",  "")
        result  =  model.infer(prompt)
       return  {"output":  result}
