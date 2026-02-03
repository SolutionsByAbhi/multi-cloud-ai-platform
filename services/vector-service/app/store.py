from  typing  import  List,  Tuple
import  numpy  as  np


class  InMemoryVectorStore:
        def  __init__(self)  ->  None:
                self.vectors:  List[np.ndarray]  =  []
               self.payloads:  List[str]  =  []

        def  add(self,  vector:  List[float],  payload:  str)  ->  None:
                self.vectors.append(np.array(vector,  dtype=float))
                self.payloads.append(payload)

        def  search(self,  query:  List[float],  top_k:  int  =  3)  ->  List[Tuple[str,  float]]:
                if  not  self.vectors:
                        return  []
                q =  np.array(query,  dtype=float)
                sims  =  [float(np.dot(q,  v)  /  (np.linalg.norm(q)  *  np.linalg.norm(v)  +  1e-8))  for  v  in  self.vectors]
                idxs  =  np.argsort(sims)[::-1][:top_k]
                return  [(self.payloads[i],  sims[i])  for  i  in  idxs]


store  =  InMemoryVectorStore()
