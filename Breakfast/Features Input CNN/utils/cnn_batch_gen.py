#!/usr/bin/python2.7

import numpy as np
import random
from helper_functions import encode_content
from base_batch_gen import Base_batch_generator

class CNN_batch_generator(Base_batch_generator):
    
    def __init__(self, nRows, nCols, actions_dict):
        super(CNN_batch_generator, self).__init__()
        self.nRows = nRows
        self.nCols = nCols
        self.actions_dict = actions_dict
        self.features = dict()
        
    def read_data(self, list_of_videos):
        for vid in list_of_videos:

            self.features[vid] = np.load("./data" + '/features/' + vid + '.npy')
            content_input = self.features[vid]

            file_ptr = open("./data/groundTruth/"+vid+".txt", 'r') 
            content_target = file_ptr.read().split('\n')[:-1] 
            
            obs_perc = [.1, .2, .3, .5]
    
            for i in range(len(obs_perc)):
                #Observe the corresponding percentage
                observed_content = content_input[:,:int(obs_perc[i]*content_input.shape[1])]
                #Downsample to 128 frames              
                resample_indexes = np.linspace(0,observed_content.shape[1],128,endpoint=False)
                resample_indexes = resample_indexes.astype(int)
                observed_content = observed_content[:,resample_indexes]
                #Prepare the input (128,64,1)
                input_vid = np.reshape(observed_content, [self.nRows, self.nCols, 1])
                
                target_content = content_target[int(obs_perc[i]*len(content_target)):int((0.5+obs_perc[i])*len(content_target))]
                target = encode_content(target_content, self.nRows, 48, self.actions_dict)
                target = np.reshape(target, [self.nRows, 48, 1])
                example = [input_vid, target]
                self.list_of_examples.append(example)
        random.shuffle(self.list_of_examples) 
        return
            
    def next_batch(self, batch_size):        
        batch = self.list_of_examples[self.index:self.index+batch_size]
        self.index += batch_size
        batch_vid  =  [b[0] for b in batch]    #  dimension (64,128,64,1)
        batch_target = [b[1] for b in batch]   #  dimension (64,128,48,1)
        
        return batch_vid, batch_target

