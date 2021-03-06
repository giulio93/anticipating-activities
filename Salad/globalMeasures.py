#!/usr/bin/python2.7

import numpy as np
import argparse
import glob
import re
import os
from sklearn.metrics import accuracy_score,recall_score,precision_score,f1_score
from sklearn.metrics import classification_report
from collections import defaultdict
from utils.helper_functions import separator

def report2dict(cr):
    # Parse rows
    tmp = list()
    for row in cr.split("\n"):
        parsed_row = [x for x in row.split("  ") if len(x) > 0]
        if len(parsed_row) > 0:
            tmp.append(parsed_row)
  
    # Store in dictionary
    measures = tmp[0]
    D_class_data = defaultdict(dict)
    for row in tmp[1:]:
        class_label = row[0].strip()
        for j, m in enumerate(measures):
            if(class_label=='accuracy'):
                D_class_data[class_label]['acc'] = float(row[1].strip())
                break
            
            else: D_class_data[class_label][m.strip()] = float(row[j + 1].strip())
         


    return D_class_data

def read_sequences(filename, recog_dir,ground_truth_path , obs_percentage):
    # read ground truth
    gt_file = args.ground_truth_path + re.sub('\.recog','.txt',re.sub('.*/','/',filename.split('\n')[0]))
    with open(gt_file, 'r') as f:
        ground_truth = f.read().split('\n')[0:-1] # Tutta la durata del video
        f.close()
    # read recognized sequence
    rec_file = recog_dir +'/' +filename.split('\n')[0].split('/')[3][:-3]+'recog'  
    if(os.path.isfile(rec_file)):
        with open(rec_file, 'r') as f:
            recognized = f.read().split('\n')[1].split() # solo la precentale riconosciuta
            f.close()   

    while((os.path.isfile(rec_file) == False)):
        model = recog_dir.split('/')[3][:-1] + str(int(recog_dir.split('/')[3][-1:])+1)
        path = recog_dir.split(recog_dir.split('/')[3])
        new_rec_path = path[0]+model+path[1]
        recog_dir = new_rec_path
        if (int(recog_dir.split('/')[3][-1:])) > 5:
            break

        if(os.path.isfile(new_rec_path +'/' +filename.split('\n')[0].split('/')[3][:-3]+'recog')):
            with open(new_rec_path +'/' +filename.split('\n')[0].split('/')[3][:-3]+'recog', 'r') as f:
                recognized = f.read().split('\n')[1].split() # solo la precentale riconosciuta
                f.close()
    
    last_frame = min(len(recognized),len(ground_truth)) #l'ultimo frame predetto
    recognized = recognized[int(obs_percentage*len(ground_truth)):last_frame] # dalla percentuale osservata fino all'ultimo frame predetto
    ground_truth = ground_truth[int(obs_percentage*len(ground_truth)):last_frame] # dalla percentuale osservata fino all'ultimo frame predetto
    
    return ground_truth, recognized
    
################################################################## 
parser = argparse.ArgumentParser()
parser.add_argument('--obs_perc',default='.3')
parser.add_argument('--recog_dir',default='./save_dir/results_GT/rnn1/obs0.3-pred0.5')
parser.add_argument("--mapping_file", default="./data/mapping.txt")
parser.add_argument('--ground_truth_path', default='./data/groundTruth')


args = parser.parse_args()

    
obs_percentage = float(args.obs_perc)
classes_file=open(args.mapping_file,'r')
content = classes_file.read()

classes = content.split('\n')[:-1]
for i in range(len(classes)):
    classes[i]=classes[i].split()[1]
    
#filelist = glob.glob(args.recog_dir + '/*')
filelist = glob.glob(args.ground_truth_path + '/*')

n_T=np.zeros(len(classes))
n_F=np.zeros(len(classes))

totalGT = []
totalRecog = []
for filename in filelist:
    gt_file = args.ground_truth_path + re.sub('\.recog','.txt',re.sub('.*/','/',filename))
    separator(gt_file)
    gt, recog = read_sequences(filename,args.recog_dir, args.ground_truth_path, obs_percentage) # gt e recog hano la stessa lunghezza
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
measures =  report2dict(classification_report(totalGT, totalRecog,target_names=np.unique(totalGT+totalRecog)))
#print(measures)
print ("MoC  %.4f"%(float(acc)/n))
# print ("AccuracyTOT  %.4f"% accuracy_score(totalGT, totalRecog, normalize=True))
# print ("RecallTOT  %.4f"% recall_score(totalGT,totalRecog,average='macro'))
# print ("PrecisionTOT  %.4f"% precision_score(totalGT,totalRecog,average='macro'))

#print ((classification_report(totalGT, totalRecog,target_names=np.unique(totalGT+totalRecog))))
print ("Accuracy  %.4f"% measures['accuracy']['acc'])
print ("Precision  %.4f"% measures['macro avg']['precision'])
print ("Recall  %.4f"% measures['macro avg']['recall'])
print ("f1-score  %.4f"% measures['macro avg']['f1-score'])
#print("No labels"+np.setdiff1d(totalGT+totalRecog,classes))











#print(classification_report(totalGT, totalRecog, labels=classes))




