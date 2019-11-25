#!/usr/bin/python2.7

import numpy as np
import argparse
import glob
import re
from sklearn.metrics import accuracy_score,recall_score,precision_score,f1_score
from sklearn.metrics import classification_report
from collections import defaultdict
#from utils.helper_functions import separator
import os
#import plotly.graph_objects as go


def read_sequences(filename, recog_dir):

    gt_file = args.ground_truth_path + re.sub('\.recog','_target.recog',re.sub('.*/','/',filename))
    with open(gt_file, 'r') as f:
        ground_truth = f.read().split('\n')[1].split()
        f.close()
    # read recognized sequence 
    with open(filename, 'r') as f:
        recognized = f.read().split('\n')[1].split()
        f.close()

    return ground_truth, recognized
    
################################################################## 
parser = argparse.ArgumentParser()
parser.add_argument('--recog_dir')
parser.add_argument("--mapping_file", default="./data/mapping_bf.txt")
parser.add_argument('--ground_truth_path')
parser.add_argument('--filelist', default='./data/groundTruth/')

args = parser.parse_args()

classes_file=open(args.mapping_file,'r')
content = classes_file.read()

classes = content.split('\n')[:-1]
for i in range(len(classes)):
    classes[i]=classes[i].split()[1]
    
filelist = glob.glob(args.recog_dir + '/*')

n_T=np.zeros(len(classes))
n_F=np.zeros(len(classes))
totalGT = []
totalRecog = []

for filename in filelist:

    gt, recog = read_sequences(filename, args.ground_truth_path) # gt e recog hano la stessa lunghezza
    if(recog != 0):
        totalGT +=gt
        totalRecog += recog

        for i in range(len(gt)):
            if gt[i]==recog[i]:
                n_T[classes.index(gt[i])]+=1 # Se la classe per questo frame e stata riconosciuta aggiugno 1 a True
            else:
                n_F[classes.index(gt[i])]+=1 # Se la calss di questo frame e errata aggiungo uno a False
##################################################################
acc=0
n=0
for i in range(len(classes)):
    if n_T[i]+n_F[i] !=0: 
        #Non tutte le classi vengono viste osservando e prevedendo solo una percentuale di video, 
        #cio che non vedonon va contato nella Mean Over Classes
        acc+=float(n_T[i])/(n_T[i]+n_F[i])      
        #Divido il numero di predizioni corrette per una classe diviso il numero di frame che appartiene alla classe, 
        #sommo il rating di correttezza di tutte le classi, ottenendo la media di corretteza sulla percentuale osservata e sulla percentuale di predizione.
        n+=1 # numero di classi presenti 
    #else: print("Never seen "+str(classes[i]))
#print(classes)

print ("MoC  %.4f"%(float(acc)/n))
report = classification_report(totalGT, totalRecog,output_dict=True)
print ("Accuracy:  " +   str(round(accuracy_score(totalGT,totalRecog) * 100,2)))
print ("Precision  " +  str(round(report['macro avg']['precision']*100,2)))
print ("Recall     "    +     str(round(report['macro avg']['recall']*100,2)))
print ("f1-score   "  +   str( round(report['macro avg']['f1-score']*100,2)))














#print(classification_report(totalGT, totalRecog, labels=classes))




