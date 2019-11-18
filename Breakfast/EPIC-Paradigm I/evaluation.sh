#!/bin/sh
source /venv/bin/activate


# python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle  --model_save_path=./save_dir/models_GT/rnn1 --results_save_path=./save_dir/results_GT/rnn1 --decoded_path=./data/decoded/split1
# python main.py --model=rnn --action=predict  --vid_list_file=./data/test.split1.bundle --model_save_path=./save_dir/models_GT/rnn1 --results_save_path=./save_dir/results_GT/rnn1 --decoded_path=./data/decoded/split1 --input_type=gt
# echo "SPLIT 1: RNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn1/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn1/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn1/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn1/obs0.2-pred0.5
# echo "SPLIT 1: RNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn1/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn1/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn1/obs0.3-pred0.3
echo "======= RNN 1 ======="
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.5 --nactions=1  --th=0.6 
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.5 --nactions=1  --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.5 --nactions=1  --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.5 --nactions=1  --th=0.6

echo "======= CNN 1 ======="
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.5 --nactions=1  --th=0.6 
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.5 --nactions=1  --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.5 --nactions=1  --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.5 --nactions=1  --th=0.6  

echo "======= RNN 2======="
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.5 --nactions=2 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.5 --nactions=2 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.5 --nactions=2 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.5 --nactions=2 --th=0.6

echo "======= CNN 2======="
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.5 --nactions=2 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.5 --nactions=2 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.5 --nactions=2 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.5 --nactions=2 --th=0.6

echo "======= RNN 3======="
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.5 --nactions=3 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.5 --nactions=3 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.5 --nactions=3 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.5 --nactions=3 --th=0.6

echo "======= CNN 3======="
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.5 --nactions=3 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.5 --nactions=3 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.5 --nactions=3 --th=0.6
python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.5 --nactions=3 --th=0.6



# python print "====== CNN ===="
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.5 --filelist=./data/40.txt
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.5 --filelist=./data/40.txt
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.5 --filelist=./data/40.txt
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.5 --filelist=./data/40.txt


# python main.py --model=cnn --action=train --vid_list_file=./data/train.split1.bundle --model_save_path=./save_dir/models_GT/cnn1 --results_save_path=./save_dir/results_GT/cnn1 --batch_size=64  --decoded_path=./data/decoded/split1 
# python main.py --model=cnn --action=predict --vid_list_file=./data/test.split1.bundle  --model_save_path=./save_dir/models_GT/cnn1 --results_save_path=./save_dir/results_GT/cnn1 --batch_size=64 --decoded_path=./data/decoded/split1  --input_type=gt
# echo "SPLIT 1: CNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn1/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn1/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn1/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn1/obs0.2-pred0.5
# echo "SPLIT 1: CNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn1/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn1/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn1/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn1/obs0.3-pred0.5

# #python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle  --model_save_path=./save_dir/models_GT/rnn2 --results_save_path=./save_dir/results_GT/rnn2 --decoded_path=./data/decoded/split2 
# python main.py --model=rnn --action=predict  --vid_list_file=./data/test.split2.bundle  --model_save_path=./save_dir/models_GT/rnn2 --results_save_path=./save_dir/results_GT/rnn2 --decoded_path=./data/decoded/split2  --input_type=gt
# echo "SPLIT 2: RNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn2/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn2/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn2/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn2/obs0.2-pred0.5
# echo "SPLIT 2: RNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn2/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn2/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn2/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn2/obs0.3-pred0.5

# #python main.py --model=cnn --action=train --vid_list_file=./data/train.split2.bundle --model_save_path=./save_dir/models_GT/cnn2 --results_save_path=./save_dir/results_GT/cnn2 --batch_size=64 --decoded_path=./data/decoded/split2 
# python main.py --model=cnn --action=predict --vid_list_file=./data/test.split2.bundle  --model_save_path=./save_dir/models_GT/cnn2 --results_save_path=./save_dir/results_GT/cnn2 --batch_size=64 --decoded_path=./data/decoded/split2  --input_type=gt
# echo "SPLIT 2: CNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn2/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn2/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn2/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn2/obs0.2-pred0.5
# echo "SPLIT 2: CNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn2/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn2/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn2/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn2/obs0.3-pred0.5

# #python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle  --model_save_path=./save_dir/models_GT/rnn3 --results_save_path=./save_dir/results_GT/rnn3 --decoded_path=./data/decoded/split3 --batch_size=64    
# python main.py --model=rnn --action=predict  --vid_list_file=./data/test.split3.bundle  --model_save_path=./save_dir/models_GT/rnn3 --results_save_path=./save_dir/results_GT/rnn3 --decoded_path=./data/decoded/split3 --batch_size=64    --input_type=gt
# echo "SPLIT 3: RNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn3/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn3/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn3/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn3/obs0.2-pred0.5
# echo "SPLIT 3: RNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn3/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn3/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn3/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn3/obs0.3-pred0.5

# #python main.py --model=cnn --action=train --vid_list_file=./data/train.split3.bundle --model_save_path=./save_dir/models_GT/cnn3 --results_save_path=./save_dir/results_GT/cnn3 --batch_size=64 --decoded_path=./data/decoded/split3     
# python main.py --model=cnn --action=predict --vid_list_file=./data/test.split3.bundle  --model_save_path=./save_dir/models_GT/cnn3 --results_save_path=./save_dir/results_GT/cnn3 --batch_size=64 --decoded_path=./data/decoded/split3  --input_type=gt
# echo "SPLIT 3: CNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn3/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn3/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn3/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn3/obs0.2-pred0.5
# echo "SPLIT 3: CNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn3/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn3/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn3/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn3/obs0.3-pred0.5


# #python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle  --model_save_path=./save_dir/models_GT/rnn4 --results_save_path=./save_dir/results_GT/rnn4 --decoded_path=./data/decoded/split4 --batch_size=64 
# python main.py --model=rnn --action=predict  --vid_list_file=./data/test.split4.bundle  --model_save_path=./save_dir/models_GT/rnn4 --results_save_path=./save_dir/results_GT/rnn4 --decoded_path=./data/decoded/split4 --batch_size=64  --input_type=gt
# echo "SPLIT 4: RNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn4/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn4/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn4/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/rnn4/obs0.2-pred0.5
# echo "SPLIT 4: RNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn4/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn4/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn4/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/rnn4/obs0.3-pred0.5

# #python main.py --model=cnn --action=train --vid_list_file=./data/train.split4.bundle --model_save_path=./save_dir/models_GT/cnn4 --results_save_path=./save_dir/results_GT/cnn4 --batch_size=64 --decoded_path=./data/decoded/split4
# python main.py --model=cnn --action=predict --vid_list_file=./data/test.split4.bundle  --model_save_path=./save_dir/models_GT/cnn4 --results_save_path=./save_dir/results_GT/cnn4 --batch_size=64 --decoded_path=./data/decoded/split4 --input_type=gt
# echo "SPLIT 4: CNN  ==> OBS:40% "
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn4/obs0.2-pred0.1
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn4/obs0.2-pred0.2
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn4/obs0.2-pred0.3
# python evalIOU.py --obs_perc=.2 --recog_dir=./save_dir/results_GT/cnn4/obs0.2-pred0.5
# echo "SPLIT 4: CNN  ==> OBS:30% "
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn4/obs0.3-pred0.1
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn4/obs0.3-pred0.2
# python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn4/obs0.3-pred0.3
#python evalIOU.py --obs_perc=.3 --recog_dir=./save_dir/results_GT/cnn4/obs0.3-pred0.5