#!/usr/bin/python2.7

import numpy as np
import os
import plotly.graph_objects as go
import colorlover as cl
import json
from collections import defaultdict
import random
from plotly.subplots import make_subplots

'''
'read a mapping dictionary between the action labels and their IDs
'''
def read_mapping_dict(mapping_file):
    file_ptr = open(mapping_file, 'r') 
    actions = file_ptr.read().split('\n')[:-1]
    
    actions_dict=dict()
    for a in actions:
        actions_dict[a.split()[1]] = int(a.split()[0])
        
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
def draw_plot(label_seq_recog,length_seq_recog,vid_recog,label_seq,length_seq,vid):


    fig = go.Figure()
    appo=defaultdict(dict)
    appo_recog=defaultdict(dict)

    total =0
    total_recog = 0
    color_used = []

    for i in range(len(label_seq)):
        appo[str(i)]['range'] = [total, total +length_seq[i]]
        appo[str(i)]['color'] = "rgb("+str((10*random.randint(1,48))%255)+","+str((5*random.randint(1,48))%255)+","+str((7*random.randint(1,48))%255)+")"
        color_used.append(appo[str(i)]['color'])
        total += length_seq[i]

    steps = []
    for a in appo:
        steps.append(appo[a])

    for i in range(len(label_seq_recog)):

        if(label_seq_recog[i]== label_seq[i]):

            appo_recog[str(i)]['range'] = [total_recog, total_recog +length_seq_recog[i]]
            appo_recog[str(i)]['color'] = appo[str(i)]['color']
            total_recog += length_seq_recog[i]
        else:
            appo_recog[str(i)]['range'] = [total_recog, total_recog +length_seq_recog[i]]
            new_color = appo['0']['color']
            while(sum([d== new_color for d in color_used])>0):
                new_color = "rgb("+str((10*random.randint(1,48))%255)+","+str((5*random.randint(1,48))%255)+","+str((7*random.randint(1,48))%255)+")"
            
            appo_recog[str(i)]['color'] = new_color
            total_recog += length_seq_recog[i]
            color_used.append(new_color)

    steps_recog = []
    for a in appo_recog:
        steps_recog.append(appo_recog[a])

    fig = make_subplots(
    rows=3, cols=1,
    vertical_spacing=0.03,
    specs=[[{"type": "table"}],
           [{"type": "indicator"}],
           [{"type": "indicator"}]]
    )

    fig.add_trace(go.Indicator(
        mode = "gauge", 
        title = {'text' :"<b>"+vid.split('/')[3]+"</b>"},
        #domain = {'x': [0.25, 1], 'y': [0.4 , 0.6]}, 
        gauge = {
            'shape': "bullet", 
            'axis': {'range': [None, total]}, 
            'steps': steps, 
            }),
            row=3, col=1)

    fig.add_trace(go.Indicator(
        mode = "gauge", 
        title = {'text' :"<b>"+vid_recog.split('/')[5]+"</b>"},
        #domain = {'x': [0.25, 1], 'y': [0.7, 0.9]},
        gauge = {
            'shape': "bullet", 
            'axis': {'range': [None, total]},
            'threshold': {
                'line': {'color': "black", 'width': 5}, 
                'thickness': 1, 'value': total * float(vid_recog.split('/')[4].split('-')[0][3:])
            }, 
            'steps': steps_recog, 
            }),
            row=2, col=1)




    fig.add_trace(
    go.Table(
            header=dict(
            values=["Length GT", "Label GT","Length", "Label"],
            font=dict(size=10),
            #align="left"
        ),
        cells=dict(
            values=[length_seq,label_seq,length_seq_recog,label_seq_recog],
            font=dict(size=10),
            height=20
            #align = "left"
            )
    ),
    row=1, col=1
)
     
    #fig.update_layout(height = 250,width =1532,  margin=dict(l=250))
    fig.update_layout(height = 400 , margin = {'t':0, 'b':0, 'l':0,'pad':0})
    

    fig.show()
    #fig.write_image("~/Pictures/"+vid_recog.split('/')[5]+".png")
   