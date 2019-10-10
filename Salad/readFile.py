
import numpy as np
import argparse



parser = argparse.ArgumentParser()

parser.add_argument("--file", default="stat.txt")

args, unknown = parser.parse_known_args()

f =  open(args.file,"r") 
vectObs = np.zeros(16)
i=0

for line in f:
        line= line.split()
        if(line[0]=='MoC'):
            vectObs[i] += float(line[1])
            i+=1
        if(i==16):
            i=0

out = np.divide(vectObs, 5) 

print(out)
