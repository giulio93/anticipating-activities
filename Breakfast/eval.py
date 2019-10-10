#!/usr/bin/python2.7

import numpy as np
import argparse
import glob
import re

def read_sequences(filename, ground_truth_path, obs_percentage):
    # read ground truth
    gt_file = args.ground_truth_path + re.sub('\.recog','.txt',re.sub('.*/','/',filename))
    with open(gt_file, 'r') as f:
        ground_truth = f.read().split('\n')[0:-1] # Tutta la durata del video
        f.close()
    # read recognized sequence
    with open(filename, 'r') as f:
        recognized = f.read().split('\n')[1].split() # solo la precentale riconosciuta
        f.close()
    
    last_frame = min(len(recognized),len(ground_truth)) #l'ultimo frame predetto
    recognized = recognized[int(obs_percentage*len(ground_truth)):last_frame] # dalla percentuale osservata fino all'ultimo frame predetto
    ground_truth = ground_truth[int(obs_percentage*len(ground_truth)):last_frame] # dalla percentuale osservata fino all'ultimo frame predetto
    
    return ground_truth, recognized
    
################################################################## 
parser = argparse.ArgumentParser()
parser.add_argument('--obs_perc')
parser.add_argument('--recog_dir')
parser.add_argument("--mapping_file", default="./data/mapping_bf.txt")
parser.add_argument('--ground_truth_path', default='./data/groundTruth')

args = parser.parse_args()

    
obs_percentage = float(args.obs_perc)
classes_file=open(args.mapping_file,'r')
content = classes_file.read()

classes = content.split('\n')[:-1]
for i in range(len(classes)):
    classes[i]=classes[i].split()[1]
    
filelist = glob.glob(args.recog_dir + '/P*')

n_T=np.zeros(len(classes))
n_F=np.zeros(len(classes))

for filename in filelist:
    gt, recog = read_sequences(filename, args.ground_truth_path, obs_percentage) # gt e recog hano la stessa lunghezza
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
print "MoC  %.4f"%(float(acc)/n)

