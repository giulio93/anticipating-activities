import numpy as np
import argparse
from helper_functions import get_label_length_seq,draw_plot


parser = argparse.ArgumentParser()
parser.add_argument("--file", default="./data/draw")


args, unknown = parser.parse_known_args()


file_ptr = open(args.file, 'r') 
list_of_videos = file_ptr.read().split('\n')[:-1]
i = 0
while i < (len(list_of_videos)-1):

    vid = list_of_videos[i]
    vid_recog = list_of_videos[i+1]     
    file_ptr = open(vid, 'r')
    content = file_ptr.read().split()[:-1]
    file_ptr_recog = open(vid_recog, 'r')
    content_recog = file_ptr_recog.read().split()[5:-1]
    
    label_seq, length_seq = get_label_length_seq(content) 
    label_seq_recog, length_seq_recog = get_label_length_seq(content_recog) 

    draw_plot(label_seq_recog,length_seq_recog,vid_recog,label_seq,length_seq,vid)

    i=i+2