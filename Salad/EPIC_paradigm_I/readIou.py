
import numpy as np
import argparse



parser = argparse.ArgumentParser()

parser.add_argument("--file", default="stat.txt")

args, unknown = parser.parse_known_args()

f =  open(args.file,"r") 
vectObs = np.zeros(6)


i=0
m=0
for line in f:
        line= line.split()

        if(line[0]=='IoU'):
            vectObs[i] += float(line[1]) 
            m= m+1 
                 
        if(m==4):
              i=i+1
              m=0

def printForLatex(out,model_name,model_name2):

   print(model_name + "&", end=" ")
   for o in out[:8]:
      print(str(round(o,4)) + "&", end=" ")
   print(r'\\')      
   print("\hline")
   print()
   print (model_name2 + "&", end=" ")
   for o in out[8:]:
         print(str(round(o,4)) + "&" ,end=" ")

   print(r"\\")
   print("\hline")


print("%================ IoU =========================%")
out = np.divide(vectObs, 4) 
print(out)
#printForLatex(out,"RNN","CNN")


