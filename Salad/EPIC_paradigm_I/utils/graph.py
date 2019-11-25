import numpy as np
import argparse
import random
from helper_functions import get_label_length_seq,draw_plot,read_mapping_dict

parser = argparse.ArgumentParser()
parser.add_argument("--file", default="./data/draw_GT")
parser.add_argument("--mapping_file", default="./data/mapping_bf.txt")
parser.add_argument("--dest", default="./images_GT")




args, unknown = parser.parse_known_args()


file_ptr = open(args.file, 'r') 
list_of_videos = file_ptr.read().split('\n')[:-1]
i = 0

actions_dict = read_mapping_dict(args.mapping_file)
nClasses = len(actions_dict)


color_dict = dict()
color_used = []
        
new_color =  "rgb("+str((10*random.randint(1,48))%255)+","+str((5*random.randint(1,48))%255)+","+str((7*random.randint(1,48))%255)+")"

for act in actions_dict:    
    while(new_color in color_used):
        new_color =  "rgb("+str((10*random.randint(1,48))%255)+","+str((5*random.randint(1,48))%255)+","+str((7*random.randint(1,48))%255)+")"

    color_dict[str(act)] = new_color
    color_used.append(new_color)

while i < (len(list_of_videos)-1):

    vid = list_of_videos[i]
    vid_recog = list_of_videos[i+1]
    fig_name = vid_recog.split('/')[3] +"_"+vid_recog.split('/')[4]

    file_ptr = open(vid, 'r')
    content = file_ptr.read().split()[:-1]
    file_ptr_recog = open(vid_recog, 'r')
    content_recog = file_ptr_recog.read().split()[5:-1]
    
    label_seq, length_seq = get_label_length_seq(content) 
    label_seq_recog, length_seq_recog = get_label_length_seq(content_recog)

    


    draw_plot(label_seq_recog,length_seq_recog,vid_recog,label_seq,length_seq,vid,color_dict,fig_name,args.dest)

    i=i+2