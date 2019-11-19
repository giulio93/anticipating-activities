#!/usr/bin/python2.7

import numpy as np
import random
from utils.base_batch_gen import Base_batch_generator
from utils.helper_functions import get_label_length_seq,draw_plot
import plotly.graph_objects as go
from plotly.subplots import make_subplots


class RNN_batch_generator(Base_batch_generator):
    
    def __init__(self, nClasses, n_iterations, max_seq_sz, actions_dict, alpha,S_enc_frame,S_ant_frame,beta_frame):
        super(RNN_batch_generator, self).__init__()
        self.n_iterations = n_iterations
        self.nClasses = nClasses
        self.max_seq_sz = max_seq_sz
        self.actions_dict = actions_dict
        self.alpha = alpha
        self.S_enc_frame=S_enc_frame
        self.S_ant_frame=S_ant_frame
        self.beta_frame=beta_frame
       

    def read_data(self, list_of_videos):
        
        beta_frame  = self.beta_frame
        S_enc_frame = self.S_enc_frame
        S_ant_frame = self.S_ant_frame
        max_sq_len = 0

        totLabels= []
       
        for vid in list_of_videos:
      
            start_To=0    
            file_ptr = open(vid, 'r')
            content = file_ptr.read().split()[:-1]
            #a scalar value used in normalizing the input length,
            #the paper specify that should be eaulq to the mean number of action per video
            T = (1.0/self.alpha)*len(content)
            #label_seq, length_seq = get_label_length_seq(content) 
            while start_To+S_enc_frame+S_ant_frame+beta_frame < len(content):    

                for stride in range(start_To+S_enc_frame+beta_frame,start_To+S_enc_frame+S_ant_frame+beta_frame,beta_frame):
                    obs  = content[start_To:start_To+stride] 
                    target = content[start_To+S_enc_frame+S_ant_frame+beta_frame]
                    label_seq, length_seq = get_label_length_seq(obs)
                    #What i'm actually obeserving. p_seq is a matrix of 48 columns like classes + 1 where it stores the lenght of the action
                    #Morover  it has 25 rows beacuse the max number in a video is 25 for breakfast
                    p_seq = []
                    seq_len = 0
                    for i in label_seq:
                        p_seq.append(np.zeros((self.nClasses+1)))
                        #Lenght of the action obeserved
                        p_seq[-1][-1] = length_seq[label_seq.index(i)]/T
                        #1-hot encoding
                        p_seq[-1][self.actions_dict[i]] = 1
                        seq_len += 1

                        if i not in totLabels:
                            totLabels.append(i)
                    #padding to zero every other free slot               
                    if(seq_len > max_sq_len):
                        max_sq_len = seq_len

                    for j in range(self.max_seq_sz - seq_len):
                            p_seq.append(np.zeros((self.nClasses+1)))

                    #The target is gonna be the next action in 1-hot fashion 
                    #label_target,_= get_label_length_seq(target)
                    p_tar = np.zeros((self.nClasses))

                    p_tar[ self.actions_dict[target]] = 1


                    example = [p_seq, p_tar]
                    self.list_of_examples.append(example)

                start_To = start_To+S_enc_frame 

            
            random.shuffle(self.list_of_examples)

        return


    def next_batch(self, batch_size):
        #batch = np.array( sorted(self.list_of_examples[self.index:self.index+batch_size], key=lambda x: x[2], reverse=True) )\
        batch = np.array(self.list_of_examples[self.index:self.index+batch_size]) 
        self.index += batch_size
        batch_vid = list(batch[:,0])
        batch_target = list(batch[:,1])
                

        return batch_vid, batch_target