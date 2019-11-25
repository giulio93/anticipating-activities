#!/usr/bin/python2.7

import numpy as np
import os
import plotly.graph_objects as go
import colorlover as cl
import json
from collections import defaultdict
import random
from plotly.subplots import make_subplots
import os
from IPython.display import Image  
import plotly.io as pio



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
    
    #f_ptr.close()
    
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
'Separate videos by lenght'
'''
def separator(filename,obs_p=0.5,path="./data",frame_rate=15):
   
    filename = filename.split('\n')[0]
    file_ptr = open(filename, 'r') 
    frames = file_ptr.read().split('\n')[:-1]
    duration = float((len(frames)*obs_p)/frame_rate)
    filename = filename.split('/')[3]
  
    if duration <= 21:
        a=''
        if os.path.isfile(path+"/"+"20.txt"):
            f_ptr1 = open(path+"/"+"20.txt","r")
            a = f_ptr1.readlines()
            f_ptr1.close()
            f_ptr1 = open(path+"/"+"20.txt","w")
            f_ptr1.writelines(a) 
            if filename+"\n" not in a:
                f_ptr1.write("\n") 
                f_ptr1.write(filename)
            f_ptr1.close()
        else:
            f_ptr1 = open(path+"/"+"20.txt","w")
            f_ptr1.write(filename)
            f_ptr1.close()
    if 21 <duration< 41:
        a=''
        if os.path.isfile(path+"/"+"2040.txt"):
            f_ptr2 = open(path+"/"+"2040.txt","r")
            a = f_ptr2.readlines()
            f_ptr2.close()
            f_ptr2 = open(path+"/"+"2040.txt","w")
            f_ptr2.writelines(a)         
            if filename+"\n" not in a: 
                f_ptr2.write("\n")            
                f_ptr2.write(filename)
            f_ptr2.close()
        else:
            f_ptr2 = open(path+"/"+"2040.txt","w")
            f_ptr2.write(filename)
            f_ptr2.close()
    
    if duration >= 41:
        a=''
        if os.path.isfile(path+"/"+"40.txt"):
            f_ptr3 = open(path+"/"+"40.txt","r")
            a = f_ptr3.readlines()
            f_ptr3.close()
            f_ptr3 = open(path+"/"+"40.txt","w")
            f_ptr3.writelines(a) 
            if filename+"\n" not in a: 
                f_ptr3.write("\n")            
                f_ptr3.write(filename)
            f_ptr3.close()
        else:
            f_ptr3 = open(path+"/"+"40.txt","w")
            f_ptr3.write(filename)
            f_ptr3.close()


'''
'Draw the color action graph
'''
def draw_plot(label_seq_recog,length_seq_recog,vid_recog,label_seq,length_seq,vid,color_dict,fig_name,dest):

    if not os.path.exists(dest):
        os.mkdir(dest)
    fig = go.Figure()
    appo=defaultdict(dict)
    appo_recog=defaultdict(dict)
    total =0
    total_recog = 0

    for i in range(len(label_seq)):
        appo[str(i)]['range'] = [total, total +length_seq[i]]
        appo[str(i)]['color'] = color_dict[label_seq[i]]
        total += length_seq[i]

    steps = []
    for a in appo:
        steps.append(appo[a])

    for i in range(len(label_seq_recog)):
        appo_recog[str(i)]['range'] = [total_recog, total_recog +length_seq_recog[i]]
        appo_recog[str(i)]['color'] = color_dict[label_seq_recog[i]]
        total_recog += length_seq_recog[i]


    steps_recog = []
    for a in appo_recog:
        steps_recog.append(appo_recog[a])

    fig = make_subplots(
    rows=3, cols=1,
    column_widths=[1000],
    row_heights=[30,30,600],
    vertical_spacing=0.10,
    specs=[[{"type": "indicator"}],
           [{"type": "indicator"}],
           [{"type": "table"}]]
    )

    fig.add_trace(go.Indicator(
        mode = "gauge", 
        title = {'text' :"<b> GT </b>"},
        domain = {'x': [0.25, 0.50], 'y': [0.4 , 0.6]}, 
        gauge = {
            'shape': "bullet", 
            'axis': {'range': [None, total]}, 
            'steps': steps, 
            }),
            row=2, col=1)

    fig.add_trace(go.Indicator(
        mode = "gauge", 
        title = {'text' :"<b> R </b>"},
        domain = {'x': [0.25, 0.50], 'y': [0.7, 0.9]},
        gauge = {
            'shape': "bullet", 
            'axis': {'range': [None, total]},
            'threshold': {
                'line': {'color': "black", 'width': 5}, 
                'thickness': 1, 'value': total * float(vid_recog.split('/')[4].split('-')[0][3:])
            }, 
            'steps': steps_recog, 
            }),
            row=1, col=1)




    fig.add_trace(
    go.Table(
            header=dict(
            values=["Length GT ", "Label GT ","Length", "Label "],
            font=dict(size=10),
            #align="left"
        ),
        cells=dict(
            values=[length_seq,label_seq,length_seq_recog,label_seq_recog,],
            font=dict(size=10),
            #align = "left"
            )
    ),
    row=3, col=1
)
     
    #fig.update_layout(height = 250,width =1532,  margin=dict(l=250))
    #fig.update_layout(height = 400 , margin = {'t':0, 'b':0, 'l':0,'pad':0})
    

    #fig.show()
    #fig.write_image("./images/"+fig_name+".png")
    # pio.orca.config.default_width = 1200
    # pio.orca.config.default_height = 600
    # pio.orca.config.save()
    fig.write_image(dest+"/"+fig_name+".png",width=2046,height=1000)



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
               D_class_data[class_label.strip()]['acc'] = float(row[1].strip())
               break
           
           else: D_class_data[class_label][m.strip()] = float(row[j + 1].strip())

    return D_class_data
   