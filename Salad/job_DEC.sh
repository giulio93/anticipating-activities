#!/bin/sh
source /venv/bin/activate


#python3 main.py --model=rnn --action=train --vid_list_file=./data/split1.train  --model_save_path=./save_dir/models/rnn1 --results_save_path=./save_dir/results/rnn1 
#python3 main.py --model=rnn --action=predict  --vid_list_file=./data/split1.test --model_save_path=./save_dir/models/rnn1 --results_save_path=./save_dir/results/rnn1 --decoded_path=./data/decoded/split1
echo "SPLIT 1: RNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn1/obs0.2-pred0.5
echo "SPLIT 1: RNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn1/obs0.3-pred0.5

#python3 main.py --model=cnn --action=train --vid_list_file=./data/split1.train --model_save_path=./save_dir/models/cnn1 --results_save_path=./save_dir/results/cnn1 --batch_size=8
#python3 main.py --model=cnn --action=predict --vid_list_file=./data/split1.test  --model_save_path=./save_dir/models/cnn1 --results_save_path=./save_dir/results/cnn1 --batch_size=8  --decoded_path=./data/decoded/split1
echo "SPLIT 1: CNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn1/obs0.2-pred0.5
echo "SPLIT 1: CNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn1/obs0.3-pred0.5

#python3 main.py --model=rnn --action=train --vid_list_file=./data/split2.train  --model_save_path=./save_dir/models/rnn2 --results_save_path=./save_dir/results/rnn2 
#python3 main.py --model=rnn --action=predict  --vid_list_file=./data/split2.test  --model_save_path=./save_dir/models/rnn2 --results_save_path=./save_dir/results/rnn2  --decoded_path=./data/decoded/split2
echo "SPLIT 2: RNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn2/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn2/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn2/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn2/obs0.2-pred0.5
echo "SPLIT 2: RNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn2/obs0.3-pred0.5

#python3 main.py --model=cnn --action=train --vid_list_file=./data/split2.train --model_save_path=./save_dir/models/cnn2 --results_save_path=./save_dir/results/cnn2 --batch_size=8 
#python3 main.py --model=cnn --action=predict --vid_list_file=./data/split2.test  --model_save_path=./save_dir/models/cnn2 --results_save_path=./save_dir/results/cnn2 --batch_size=8  --decoded_path=./data/decoded/split2
echo "SPLIT 2: CNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn2/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn2/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn2/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn2/obs0.2-pred0.5
echo "SPLIT 2: CNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn2/obs0.3-pred0.5

#python3 main.py --model=rnn --action=train --vid_list_file=./data/split3.train  --model_save_path=./save_dir/models/rnn3 --results_save_path=./save_dir/results/rnn3 
#python3 main.py --model=rnn --action=predict  --vid_list_file=./data/split3.test  --model_save_path=./save_dir/models/rnn3 --results_save_path=./save_dir/results/rnn3 --decoded_path=./data/decoded/split3  
echo "SPLIT 3: RNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn3/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn3/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn3/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn3/obs0.2-pred0.5
echo "SPLIT 3: RNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn3/obs0.3-pred0.5

#python3 main.py --model=cnn --action=train --vid_list_file=./data/split3.train --model_save_path=./save_dir/models/cnn3 --results_save_path=./save_dir/results/cnn3 --batch_size=8   
#python3 main.py --model=cnn --action=predict --vid_list_file=./data/split3.test  --model_save_path=./save_dir/models/cnn3 --results_save_path=./save_dir/results/cnn3 --batch_size=8 --decoded_path=./data/decoded/split3
echo "SPLIT 3: CNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn3/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn3/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn3/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn3/obs0.2-pred0.5
echo "SPLIT 3: CNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn3/obs0.3-pred0.5


#python3 main.py --model=rnn --action=train --vid_list_file=./data/split4.train  --model_save_path=./save_dir/models/rnn4 --results_save_path=./save_dir/results/rnn4 
#python3 main.py --model=rnn --action=predict  --vid_list_file=./data/split4.test  --model_save_path=./save_dir/models/rnn4 --results_save_path=./save_dir/results/rnn4  --decoded_path=./data/decoded/split4
echo "SPLIT 4: RNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn4/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn4/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn4/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn4/obs0.2-pred0.5
echo "SPLIT 4: RNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn4/obs0.3-pred0.5

#python3 main.py --model=cnn --action=train --vid_list_file=./data/split4.train --model_save_path=./save_dir/models/cnn4 --results_save_path=./save_dir/results/cnn4 --batch_size=8 
#python3 main.py --model=cnn --action=predict --vid_list_file=./data/split4.test  --model_save_path=./save_dir/models/cnn4 --results_save_path=./save_dir/results/cnn4 --batch_size=8  --decoded_path=./data/decoded/split4
echo "SPLIT 4: CNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn4/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn4/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn4/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn4/obs0.2-pred0.5
echo "SPLIT 4: CNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn4/obs0.3-pred0.5

#python3 main.py --model=rnn --action=train --vid_list_file=./data/split5.train  --model_save_path=./save_dir/models/rnn5 --results_save_path=./save_dir/results/rnn5  
#python3 main.py --model=rnn --action=predict  --vid_list_file=./data/split5.test  --model_save_path=./save_dir/models/rnn5 --results_save_path=./save_dir/results/rnn5   --decoded_path=./data/decoded/split5
echo "SPLIT 5: RNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn5/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn5/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn5/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/rnn5/obs0.2-pred0.5
echo "SPLIT 5: RNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn5/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn5/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn5/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/rnn5/obs0.3-pred0.5

#python3 main.py --model=cnn --action=train --vid_list_file=./data/split5.train --model_save_path=./save_dir/models/cnn5 --results_save_path=./save_dir/results/cnn5 --batch_size=8  
#python3 main.py --model=cnn --action=predict --vid_list_file=./data/split5.test  --model_save_path=./save_dir/models/cnn5 --results_save_path=./save_dir/results/cnn5 --batch_size=8   --decoded_path=./data/decoded/split5
echo "SPLIT 5: CNN  ==> OBS:20% "
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn5/obs0.2-pred0.1
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn5/obs0.2-pred0.2
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn5/obs0.2-pred0.3
python3 eval.py --obs_perc=.2 --recog_dir=./save_dir/results/cnn5/obs0.2-pred0.5
echo "SPLIT 5: CNN  ==> OBS:30% "
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn5/obs0.3-pred0.1
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn5/obs0.3-pred0.2
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn5/obs0.3-pred0.3
python3 eval.py --obs_perc=.3 --recog_dir=./save_dir/results/cnn5/obs0.3-pred0.5