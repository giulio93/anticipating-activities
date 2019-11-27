#!/usr/bin/python2.7

import numpy as np
import argparse
import glob
import re
from sklearn.metrics import accuracy_score,recall_score,precision_score,f1_score
from sklearn.metrics import classification_report
from collections import defaultdict
from utils.helper_functions import separator, get_label_length_seq,get_label_dict
import os
import plotly.graph_objects as go

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
       class_label = row[0]
       for j, m in enumerate(measures):
           if(class_label=='accuracy'):
               D_class_data[class_label]['acc'] = float(row[1].strip())
               break
           
           else: D_class_data[class_label][m.strip()] = float(row[j + 1].strip())

    return D_class_data

def read_sequences(filename, recog_dir, obs_percentage):

    gt_file = args.ground_truth_path + re.sub('\.recog','.txt',re.sub('.*/','/',filename))
    with open(gt_file, 'r') as f:
        ground_truth = f.read().split('\n')[0:-1]
        f.close()
    # read recognized sequence
    with open(filename, 'r') as f:
        recognized = f.read().split('\n')[1].split()
        f.close()

    if(recognized!=0):
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
parser.add_argument('--nactions', default='1')
parser.add_argument('--th', default='0.5')

args = parser.parse_args()

obs_percentage = float(args.obs_perc)
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
IoU = 0
index_act= int(args.nactions)
div=0

for filename in filelist:

    gt, recog = read_sequences(filename, args.ground_truth_path, obs_percentage) # gt e recog hano la stessa lunghezza
    if(recog != 0):
        
        label_seq_gt, length_seq_gt =  get_label_length_seq(gt)
        label_seq_recog, length_seq_recog =  get_label_length_seq(recog)

        gt_dict = get_label_dict(gt)
        recog_dict = get_label_dict(recog)

        if(len(label_seq_gt) >= index_act):
            act  = label_seq_gt[index_act-1]
            start_gt = gt_dict[index_act-1][1]
            stop_gt  = gt_dict[index_act-1][2]

            # if(start_gt!=0):
            #     print("ciao")
            #     gt_dict = get_label_dict(recog_dict)
            
            act_recog = recog[start_gt:stop_gt]

            if(np.unique(act_recog).__contains__(act)):
                rActIndex = []
               

                for x in  filter(lambda x: x[0]==act,recog_dict) :
                    if((start_gt<+x[1]<=stop_gt) and  (start_gt<=x[2]<=stop_gt)):
                        rActIndex.append(recog_dict.index(x))
                    elif ((x[1]<=start_gt<=x[2]) and (x[1]<=stop_gt<=x[2])) :
                        rActIndex.append(recog_dict.index(x))
                    elif (start_gt<=x[1]<=stop_gt):
                        rActIndex.append(recog_dict.index(x))
                    elif (start_gt<=x[2]<=stop_gt):
                        rActIndex.append(recog_dict.index(x))        
                
                c=0
                for r in rActIndex:
                    start_recog = recog_dict[r][1]
                    stop_recog  = recog_dict[r][2]

                    Union = max(stop_gt,stop_recog) - min(start_gt,start_recog)
                    Intersection = min(stop_gt,stop_recog) - max(start_gt,start_recog) 

                    rap = float(Intersection / Union)
                    if(rap >=0.5):
                        c=c+1
                        if(c>1):
                            print(act)
                        IoU+=1
                    
            div= div +1

print ("IoU  %.4f"%(float(IoU)/div))














