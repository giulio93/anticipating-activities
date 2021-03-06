#!/usr/bin/python2.7

import numpy as np
import os
import plotly.graph_objects as go
import colorlover as cl
import json
from collections import defaultdict
import random
'''
'read a mapping dictionary between the action labels and their IDs
'''
def read_mapping_dict(mapping_file):
    file_ptr = open(mapping_file, 'r') 
    actions = file_ptr.read().split('\n')[:-1]
    
    actions_dict=dict()
    for a in actions:
        actions_dict[a.split(',')[1]] = int(a.split(',')[0])
        
    return actions_dict
        
'''
'Encode a sequence of actions into a matrix form for the cnn model
'''
def encode_content(content, nRows, nCols, actions_dict):
    encoded_content = np.zeros([nRows, nCols])

    start=0
    s=0
    e=0
    for i in range(len(content)):
        if content[i] != content[start]:
            frame_label = np.zeros((nCols))
            frame_label[ actions_dict[content[start]] ] = 1
            s = int( nRows*(1.0*start/len(content)) )
            e = int( nRows*(1.0*i/len(content)) )
            encoded_content[s:e]=frame_label
            start = i
    frame_label = np.zeros((nCols))
    frame_label[ actions_dict[content[start]] ] = 1
    encoded_content[e:]=frame_label

    return encoded_content

'''
'Write the prediction output to a file
'''    
def write_predictions(path, f_name, recognition):
    if not os.path.exists(path):
        os.makedirs(path)
    f_ptr = open(path+"/"+f_name+".recog","w")

    f_ptr.write("### Frame level recognition: ###\n")
    f_ptr.write(' '.join(recognition))
    
    f_ptr.close()
    
'''
'Get the sequence of labels and length for a givien frame-wise action labels
'''
def get_label_length_seq(content):
    label_seq = []
    length_seq = []
    start = 0
    for i in range(len(content)):
        if content[i] != content[start]:
            label_seq.append(content[start])
            length_seq.append(i-start)
            start = i
    label_seq.append(content[start])
    length_seq.append(len(content)-start)
    
    return label_seq, length_seq

'''
'Draw the color action graph
'''
def draw_plot(label_seq,length_seq,vid):

    fig = go.Figure()
    appo=defaultdict(dict)
    total =0
    for i in range(len(label_seq)):
        appo[str(i)]['range'] = [total, total +length_seq[i]]
        appo[str(i)]['color'] = "rgb("+str((10*random.randint(1,48))%255)+","+str((5*random.randint(1,48))%255)+","+str((7*random.randint(1,48))%255)+")"
        total += length_seq[i]

    steps = []
    for a in appo:
        steps.append(appo[a])

    fig.add_trace(go.Indicator(
        mode = "gauge", 
        title = {'text' :"<b>"+vid.split('/')[3]+"</b>"}, 
        gauge = {
            'shape': "bullet", 
            'axis': {'range': [None, total]}, 
            'steps': steps, 
            }))
     
    fig.update_layout(height = 250,width =1532,  margin=dict(l=250))
    fig.show()
   