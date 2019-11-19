#!/usr/bin/python2.7

import tensorflow as tf
import numpy as np
import argparse
import math
from models.cnn import ModelCNN
from models.rnn import ModelRNN
from utils.base_batch_gen import Base_batch_generator
from utils.rnn_batch_gen import RNN_batch_generator
from utils.cnn_batch_gen import CNN_batch_generator
from utils.helper_functions import read_mapping_dict, encode_content, write_predictions, get_label_length_seq,draw_plot,report2dict
from sklearn.metrics import accuracy_score,recall_score,precision_score,f1_score
from sklearn.metrics import classification_report

parser = argparse.ArgumentParser()

parser.add_argument("--model", default="rnn", help="select model: [\"rnn\", \"cnn\"]")
parser.add_argument("--action", default="train", help="select action: [\"train\", \"predict\"]")

parser.add_argument("--mapping_file", default="./data/mapping_bf.txt")
parser.add_argument("--vid_list_file", default="./data/draw")
parser.add_argument("--model_save_path", default="./save_dir/models/rnn")
parser.add_argument("--results_save_path", default="./save_dir/results/rnn")

parser.add_argument("--save_freq", type=int, default=1)
parser.add_argument("--batch_size", type=int, default=512)
parser.add_argument("--nEpochs", type=int, default=20)
parser.add_argument("--eval_epoch", type=int, default=20)

#RNN specific parameters
parser.add_argument("--rnn_size", type=int, default=256)
parser.add_argument("--num_layers", type=int, default=2)
parser.add_argument("--max_seq_sz", type=int, default=6)
parser.add_argument("--alpha", type=float, default=12, help="a scalar value used in normalizing the input length")
parser.add_argument("--n_iterations", type=int, default=10, help="number of training examples corresponding to each action segment for the rnn")

#CNN specific parameters
parser.add_argument("--nRows", type=int, default=128)
parser.add_argument("--sigma", type=int, default=3, help="sigma for the gaussian smoothing step")

#Test on GT or decoded input
parser.add_argument("--input_type", default="decoded", help="select input type: [\"decoded\", \"gt\"]")
parser.add_argument("--decoded_path", default="./data/decoded/split1")

#Observation and predction time for EPIC-Kitchen paradigm, T_o e T_a needs to be expressed in frames, please take into account that for Breakfast and Salad both are sampled with 15fps
parser.add_argument("--S_enc", default=6)
parser.add_argument("--S_ant", default=8)
parser.add_argument("--beta", default=0.25)

################################################################################################################################################

args, unknown = parser.parse_known_args()

actions_dict = read_mapping_dict(args.mapping_file)
nClasses = len(actions_dict)

file_ptr = open(args.vid_list_file, 'r') 
list_of_videos = file_ptr.read().split('\n')[1:-1]

################
# Training #####
################
if args.action == "train":
    model = None
    batch_gen = Base_batch_generator()
    beta_frame  = int(math.ceil(float(args.beta) * 15))
    S_enc_frame = (int(args.S_enc) * beta_frame)
    S_ant_frame = (int(args.S_ant) * beta_frame)
    
    if args.model == "rnn":
        model = ModelRNN(nClasses, args.rnn_size, args.max_seq_sz, args.num_layers)
        batch_gen = RNN_batch_generator(nClasses, args.n_iterations, args.max_seq_sz, actions_dict, args.alpha,S_enc_frame,S_ant_frame,beta_frame)
    elif args.model == "cnn":
        model = ModelCNN(args.nRows, nClasses)
        batch_gen = CNN_batch_generator(args.nRows, nClasses, actions_dict)
        
    batch_gen.read_data(list_of_videos)
    with tf.Session() as sess:
        model.train(sess, args.model_save_path, batch_gen, args.nEpochs, args.save_freq, args.batch_size)

##################
# Prediction #####
##################
elif args.action == "predict":
    pred_percentages = [.1, .2, .3, .5]
    obs_percentages = [.2, .3]

    beta_frame  = int(math.ceil(float(args.beta) * 15))
    S_enc_frame = (int(args.S_enc) * beta_frame)
    S_ant_frame = (int(args.S_ant) * beta_frame)
    model_restore_path = args.model_save_path+"/epoch-"+str(args.eval_epoch)+"/model.ckpt" 
    
    if args.model == "rnn":

        model = ModelRNN(nClasses, args.rnn_size, args.max_seq_sz, args.num_layers)
        batch_gen = RNN_batch_generator(nClasses, args.n_iterations, args.max_seq_sz, actions_dict, args.alpha,S_enc_frame,S_ant_frame,beta_frame)
        batch_gen.read_data(list_of_videos)
        recog_sq = {}
        target_sq = {}

        for vid in list_of_videos:
            f_name = vid.split('/')[-1].split('.')[0]
            observed_content=[]
            vid_len = 0
            
            max_sq_len = 0

            if args.input_type == "gt":
                start_To=0    
                file_ptr = open(vid, 'r')
                content = file_ptr.read().split()[:-1]
                vid_len = len(content)
                T = (1.0/args.alpha)*vid_len
                
                for init in range(8):
                    recog_sq[str(init)] = ["start"]
                for init in range(8):
                    target_sq[str(init)] = ["start"]



                while start_To+S_enc_frame+S_ant_frame+beta_frame < len(content):    

                    k=0
                    for stride in range(start_To+S_enc_frame+beta_frame,start_To+S_enc_frame+S_ant_frame+beta_frame,beta_frame):
                        obs  = content[start_To:start_To+stride] 
                        target = content[start_To+S_enc_frame+S_ant_frame+beta_frame]
                        label_seq, length_seq = get_label_length_seq(obs)
                        #What i'm actually obeserving. p_seq is a matrix of 48 columns like classes + 1 where it stores the lenght of the action
                        #Morover  it has 25 rows beacuse the max number in a video is 25 for breakfast
                        p_seq = []
                        seq_len = 0
                        for i in label_seq:
                            p_seq.append(np.zeros((nClasses+1)))
                            #Lenght of the action obeserved
                            p_seq[-1][-1] = length_seq[label_seq.index(i)]/T
                            #1-hot encoding
                            p_seq[-1][actions_dict[i]] = 1
                            seq_len += 1
                        #padding to zero every other free slot               
                        if(seq_len > max_sq_len):
                            max_sq_len = seq_len

                        for j in range(args.max_seq_sz - seq_len):
                                p_seq.append(np.zeros((nClasses+1)))

                        with tf.Session() as sess:
                           label = model.predict(sess, model_restore_path, p_seq ,actions_dict, T)

                        # recog_sq.append(label)
                        # target_sq.append(target)

                        
                        recog_sq[str(k)].append(label)
                        target_sq[str(k)].append(target)

                        k+=1                      
                    start_To = start_To+S_enc_frame 


                for m in range(len(recog_sq.keys())):
                    
                    target = target_sq[str(m)][1:]
                    recog  =  recog_sq[str(m)][1:]

                    f_name = vid.split('/')[-1].split('.')[0]
                    path=args.results_save_path+"/obs"+str(int(args.S_enc))+"-pred"+str(m)
                    write_predictions(path, f_name, recog)
                    path=args.results_save_path+"/obs"+str(int(args.S_enc))+"-pred"+str(m)+"_target"
                    write_predictions(path,f_name+"_target", target)

                    report = classification_report(target, recog,output_dict=True)
                    print ("Accuracy:  " +   str(round(accuracy_score(target,recog) * 100,2)))
                    print ("Precision  " +  str(round(report['macro avg']['precision']*100,2)))
                    print ("Recall     "    +     str(round(report['macro avg']['recall']*100,2)))
                    print ("f1-score   "  +   str( round(report['macro avg']['f1-score']*100,2)))


                    n_T=np.zeros(len(actions_dict.keys()))
                    n_F=np.zeros(len(actions_dict.keys()))
                    for i in range(len(target)):
                        if target[i]==recog[i]:
                            n_T[actions_dict[target[i]]]+=1 # Se la classe per questo frame e stata riconosciuta aggiugno 1 a True
                        else:
                            n_F[actions_dict[target[i]]]+=1 # Se la calss di questo frame e errata aggiungo uno a False
                    
                    acc=0
                    n=0
                    for i in range(len(actions_dict.keys())):
                        if n_T[i]+n_F[i] !=0: 
                            #Non tutte le classi vengono viste osservando e prevedendo solo una percentuale di video, 
                            #cio che non vedonon va contato nella Mean Over Classes
                            acc+=float(n_T[i])/(n_T[i]+n_F[i])      
                            #Divido il numero di predizioni corrette per una classe diviso il numero di frame che appartiene alla classe, 
                            #sommo il rating di correttezza di tutte le classi, ottenendo la media di corretteza sulla percentuale osservata e sulla percentuale di predizione.
                            n+=1 # numero di classi presenti 
                        #else: print("Never seen "+str(classes[i]))
                    #print(classes)
                    #measures =  report2dict(classification_report(totalGT, totalRecog,target_names=np.unique(totalGT+totalRecog)))

                    print ("MoC  %.4f"%(float(acc)/n))
            
        