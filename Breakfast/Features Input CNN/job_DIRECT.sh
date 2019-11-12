/bin/sh
source /venv/bin/activate


python main.py --model=cnn --action=train    --vid_list_file=./data/train.split1.direct.bundle --model_save_path=./save_dir/models_direct/cnn1 --results_save_path=./save_dir/results_direct/cnn1 --batch_size=32   
python main.py --model=cnn --action=predict --input_type=gt  --vid_list_file=./data/test.split1.direct.bundle  --model_save_path=./save_dir/models_direct/cnn1 --results_save_path=./save_dir/results_direct/cnn1 --batch_size=32 
echo "SPLIT 1: CNN  ==> OBS:20% "
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn1/obs0.2-pred0.1
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn1/obs0.2-pred0.2
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn1/obs0.2-pred0.3
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn1/obs0.2-pred0.5
echo "SPLIT 1: CNN  ==> OBS:30% "
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn1/obs0.3-pred0.1
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn1/obs0.3-pred0.2
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn1/obs0.3-pred0.3
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn1/obs0.3-pred0.5

python main.py --model=cnn --action=train --vid_list_file=./data/train.split2.direct.bundle --model_save_path=./save_dir/models_direct/cnn2 --results_save_path=./save_dir/results_direct/cnn2 --batch_size=32  
python main.py --model=cnn --action=predict --input_type=gt --vid_list_file=./data/test.split2.direct.bundle  --model_save_path=./save_dir/models_direct/cnn2 --results_save_path=./save_dir/results_direct/cnn2 --batch_size=32 
echo "SPLIT 2: CNN  ==> OBS:20% "
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn2/obs0.2-pred0.1
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn2/obs0.2-pred0.2
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn2/obs0.2-pred0.3
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn2/obs0.2-pred0.5
echo "SPLIT 2: CNN  ==> OBS:30% "
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn2/obs0.3-pred0.1
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn2/obs0.3-pred0.2
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn2/obs0.3-pred0.3
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn2/obs0.3-pred0.5


python main.py --model=cnn --action=train --vid_list_file=./data/train.split3.direct.bundle --model_save_path=./save_dir/models_direct/cnn3 --results_save_path=./save_dir/results_direct/cnn3 --batch_size=32     
python main.py --model=cnn --action=predict --input_type=gt --vid_list_file=./data/test.split3.direct.bundle  --model_save_path=./save_dir/models_direct/cnn3 --results_save_path=./save_dir/results_direct/cnn3 --batch_size=32 
echo "SPLIT 3: CNN  ==> OBS:20% "
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn3/obs0.2-pred0.1
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn3/obs0.2-pred0.2
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn3/obs0.2-pred0.3
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn3/obs0.2-pred0.5
echo "SPLIT 3: CNN  ==> OBS:30% "
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn3/obs0.3-pred0.1
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn3/obs0.3-pred0.2
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn3/obs0.3-pred0.3
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn3/obs0.3-pred0.5

python main.py --model=cnn --action=train --vid_list_file=./data/train.split4.direct.bundle --model_save_path=./save_dir/models_direct/cnn4 --results_save_path=./save_dir/results_direct/cnn4 --batch_size=32 
python main.py --model=cnn --action=predict --input_type=gt --vid_list_file=./data/test.split4.direct.bundle  --model_save_path=./save_dir/models_direct/cnn4 --results_save_path=./save_dir/results_direct/cnn4 --batch_size=32 
echo "SPLIT 4: CNN  ==> OBS:20% "
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn4/obs0.2-pred0.1
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn4/obs0.2-pred0.2
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn4/obs0.2-pred0.3
python eval.py --obs_perc=.2 --recog_dir=./save_dir/results_direct/cnn4/obs0.2-pred0.5
echo "SPLIT 4: CNN  ==> OBS:30% "
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn4/obs0.3-pred0.1
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn4/obs0.3-pred0.2
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn4/obs0.3-pred0.3
python eval.py --obs_perc=.3 --recog_dir=./save_dir/results_direct/cnn4/obs0.3-pred0.5