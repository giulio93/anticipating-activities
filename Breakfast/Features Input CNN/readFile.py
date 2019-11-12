
import numpy as np
import argparse



parser = argparse.ArgumentParser()

parser.add_argument("--file", default="stat.txt")

args, unknown = parser.parse_known_args()

f =  open(args.file,"r") 
vectObs = np.zeros(8)
vectAcc = np.zeros(16)
vectAT = np.zeros(16)
vectRT = np.zeros(16)
vectPC = np.zeros(16)
i=0

for line in f:
        line= line.split()

        if(line[0]=='MoC'):
            vectObs[i] += float(line[1])
            i=i+1
         
      #   if(line[0]=='Accuracy'):
      #       vectAcc[i] += float(line[1])

      #   if(line[0]=='Precision'):
      #      vectAT[i] += float(line[1])

      #   if(line[0]=='Recall'):
      #      vectRT[i] += float(line[1]) 

      #   if(line[0]=='f1-score'):
      #      vectPC[i] += float(line[1])
      #      i=i+1
                 
        if(i==8):
            i=0

def printForLatex(out,model_name,model_name2):

   print(model_name + "&", end=" ")
   for o in out:
      print(str(round(o,4)) + "&", end=" ")
   print(r'\\')      
   print("\hline")
   print()
   print (model_name2 + "&", end=" ")
   # for o in out[8:]:
   #       print(str(round(o,4)) + "&" ,end=" ")

   print(r"\\")
   print("\hline")


print("%================ MOC =========================%")
out = np.divide(vectObs, 4) 
printForLatex(out,"CNN","CNN")

# print("%================ ACCURACY TOT  =========================%")
# out9 = np.divide(vectAcc, 4) 
# printForLatex(out9,"RNN ACC","CNN ACC")

# print("%================ PRECISION TOT  =========================%")
# out1 = np.divide(vectAT, 4) 
# printForLatex(out1,"RNN PREC","CNN PREC")

# print("%================ REC TOT =========================%")
# out2 = np.divide(vectRT, 4) 
# printForLatex(out2,"RNN REC","CNN REC")

# print("%================ F1 REC TOT =========================%")
# out3 = np.divide(vectPC, 4) 
# printForLatex(out3,"RNN F1","CNN F1")
