
import numpy as np
import argparse



parser = argparse.ArgumentParser()

parser.add_argument("--file", default="stat.txt")

args, unknown = parser.parse_known_args()

f =  open(args.file,"r")
vectObs = np.zeros(16)
vectAcc = np.zeros(16)
vectAT = np.zeros(16)
vectRT = np.zeros(16)
vectPC = np.zeros(16)
i=0

def init():
   self.vectObs = np.zeros(16)
   self.vectAcc = np.zeros(16)
   self.vectAT = np.zeros(16)
   self.vectRT = np.zeros(16)
   self.vectPC = np.zeros(16)
   i=0

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

def print_measure():
   print("%================ MOC =========================%")
   out = np.divide(self.vectObs, 4) 
   printForLatex(out,"RNN","CNN")

   print("%================ ACCURACY TOT  =========================%")
   out9 = np.divide(self.vectAcc, 4) 
   printForLatex(out9,"RNN ACC","CNN ACC")

   print("%================ PRECISION TOT  =========================%")
   out1 = np.divide(self.vectAT, 4) 
   printForLatex(out1,"RNN PREC","CNN PREC")

   print("%================ REC TOT =========================%")
   out2 = np.divide(self.vectRT, 4) 
   printForLatex(out2,"RNN REC","CNN REC")

   print("%================ F1 REC TOT =========================%")
   out3 = np.divide(self.vectPC, 4) 
   printForLatex(out3,"RNN F1","CNN F1")

for line in f:
      line= line.split()

      if(line[0]== "START" or line[0]=="END"):
         print_measure()
         init()

      if(line[0]=='MoC'):
          vectObs[i] += float(line[1])
       
      if(line[0]=='Accuracy'):
          vectAcc[i] += float(line[1])

      if(line[0]=='Precision'):
         vectAT[i] += float(line[1])

      if(line[0]=='Recall'):
         vectRT[i] += float(line[1]) 

      if(line[0]=='f1-score'):
         vectPC[i] += float(line[1])
         i=i+1
               
      if(i==16):
          i=0


