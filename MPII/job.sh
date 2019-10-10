#!/bin/sh
source /venv/bin/activate


# python main.py --model=rnn --action=train --vid_list_file=./data/split1.train.txt  --model_save_path=./save_dir/models/rnn1 --results_save_path=./save_dir/results/rnn1  --max_seq_sz=341
# python main.py --model=rnn --action=predict --input_type=gt --vid_list_file=./data/split1.test.txt  --model_save_path=./save_dir/models/rnn1 --results_save_path=./save_dir/results/rnn1 --max_seq_sz=341
# echo "SPLIT 1: RNN  ==> OBS:20% "
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.1 
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.2
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.3
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.5
echo "SPLIT 1: RNN  ==> OBS:30% "
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.1
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.2
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.3
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.5

# python main.py --model=cnn --action=train --vid_list_file=./data/split1.train.txt --model_save_path=./save_dir/models/cnn1 --results_save_path=./save_dir/results/cnn1 --batch_size=64 
# python main.py --model=cnn --action=predict --vid_list_file=./data/split1.test.txt --input_type=gt --model_save_path=./save_dir/models/cnn1 --results_save_path=./save_dir/results/cnn1 --batch_size=64
echo "SPLIT 1: CNN  ==> OBS:20% "
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.1
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.2
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.3
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.5
echo "SPLIT 1: CNN  ==> OBS:30% "
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.1
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.2
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.3
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.5
