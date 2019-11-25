#!/usr/bin/python2.7

import numpy as np
import argparse
import glob
import re
from sklearn.metrics import accuracy_score,recall_score,precision_score,f1_score
from sklearn.metrics import classification_report
from collections import defaultdict
from utils.helper_functions import separator
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
    # while((os.path.isfile(recog_dir +'/' +filename.split('\n')[0].split('/')[3][:-3]+'recog') == False)):
    #     model = recog_dir.split('/')[3][:-1] + str(int(recog_dir.split('/')[3][-1:])+1)
    #     path = recog_dir.split(recog_dir.split('/')[3])
    #     new_rec_path = path[0]+model+path[1]
    #     recog_dir = new_rec_path
    #     if (int(recog_dir.split('/')[3][-1:])) > 4:
    #         break

    #     if(os.path.isfile(new_rec_path +'/' +filename.split('\n')[0].split('/')[3][:-3]+'recog')):
    #         with open(new_rec_path +'/' +filename.split('\n')[0].split('/')[3][:-3]+'recog', 'r') as f:
    #             recognized = f.read().split('\n')[1].split() # solo la precentale riconosciuta
    #             f.close()


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


#parser.add_argument('--filelist', default='./data/groundTruth/')

args = parser.parse_args()

obs_percentage = float(args.obs_perc)
classes_file=open(args.mapping_file,'r')
content = classes_file.read()
classes = content.split('\n')[:-1]
for i in range(len(classes)):
    classes[i]=classes[i].split()[1]
    
filelist = glob.glob(args.recog_dir + '/*')
#f = open(args.filelist)
#filelist = f.readlines()


n_T=np.zeros(len(classes))
n_F=np.zeros(len(classes))
totalGT = []
totalRecog = []
IoU = 0
index_act= int(args.nactions)
div=0

for filename in filelist:
    #gt_file = args.ground_truth_path + re.sub('\.recog','.txt',re.sub('.*/','/',filename))
    #separator(gt_file,0.5)
    gt, recog = read_sequences(filename, args.ground_truth_path, obs_percentage) # gt e recog hano la stessa lunghezza
    if(recog != 0):
        actions_gt = np.unique(gt)
        actions_recog = np.unique(recog)
        if(len(actions_gt)>=index_act and len(actions_recog)>=index_act):
            act  = actions_gt[index_act-1]
            if(actions_recog[index_act-1] == act):

                if(recog.count(act) >= int(gt.count(act)*float(args.th))):
                    IoU+=1
            div +=1

        # totalGT +=gt
        # totalRecog += recog

        # for i in range(len(gt)):
        #     if gt[i]==recog[i]:
        #         n_T[classes.index(gt[i])]+=1 # Se la classe per questo frame e stata riconosciuta aggiugno 1 a True
        #     else:
        #         n_F[classes.index(gt[i])]+=1 # Se la calss di questo frame e errata aggiungo uno a False
##################################################################
# acc=0
# n=0
# for i in range(len(classes)):
#     if n_T[i]+n_F[i] !=0: 
#         #Non tutte le classi vengono viste osservando e prevedendo solo una percentuale di video, 
#         #cio che non vedonon va contato nella Mean Over Classes
#         acc+=float(n_T[i])/(n_T[i]+n_F[i])      
#         #Divido il numero di predizioni corrette per una classe diviso il numero di frame che appartiene alla classe, 
#         #sommo il rating di correttezza di tutte le classi, ottenendo la media di corretteza sulla percentuale osservata e sulla percentuale di predizione.
#         n+=1 # numero di classi presenti 
#     #else: print("Never seen "+str(classes[i]))
# #print(classes)
# #measures =  report2dict(classification_report(totalGT, totalRecog,target_names=np.unique(totalGT+totalRecog)))

print ("IoU  %.4f"%(float(IoU)/div))
# print ("AccuracyTOT  %.4f"% accuracy_score(totalGT, totalRecog, normalize=True))
# print ("RecallTOT  %.4f"% recall_score(totalGT,totalRecog,average='macro'))
# print ("PrecisionTOT  %.4f"% precision_score(totalGT,totalRecog,average='macro'))

#print (measures)
# print ("Accuracy  %.4f"% measures['accuracy']['acc'])
# print ("Precision  %.4f"% measures[' macro avg']['precision'])
# print ("Recall  %.4f"% measures[' macro avg']['recall'])
# print ("f1-score  %.4f"% measures[' macro avg']['f1-score'])


# animals=['<20s', '20s-40s', '40s>']

# fig = go.Figure(data=[
#     go.Bar(name='RNN', x=animals, y=[0.2445, 0.1927, 0.1749]),
#     go.Bar(name='CNN', x=animals, y=[0.2237, 0.1735, 0.1810])
# ])
# # Change the bar mode
# fig.update_layout(barmode='group')
# fig.update_layout( autosize=False,
#     width=1000,
#     height=1000,)
# fig.show()
# fig.show()











#print(classification_report(totalGT, totalRecog, labels=classes))




