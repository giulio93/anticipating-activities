#!/bin/sh
source /venv/bin/activate

echo "START "

echo "SPLIT 1 ==> EP 15-15 "
python main.py --model=rnn --To=15 --Ta=15 --action=train --vid_list_file=./data/train.split1.bundle  --model_save_path=./save_dir/models_15_15/rnn1 --results_save_path=./save_dir/results_15_15/rnn1 
python main.py --model=rnn --To=15 --Ta=15 --action=predict  --vid_list_file=./data/test.split1.bundle --model_save_path=./save_dir/models_15_15/rnn1 --results_save_path=./save_dir/results_15_15/rnn1  --input_type=gt
echo "SPLIT 2 ==> EP 15-15 "
python main.py --model=rnn --To=15 --Ta=15 --action=train --vid_list_file=./data/train.split2.bundle  --model_save_path=./save_dir/models_15_15/rnn2 --results_save_path=./save_dir/results_15_15/rnn2 
python main.py --model=rnn --To=15 --Ta=15 --action=predict  --vid_list_file=./data/test.split2.bundle  --model_save_path=./save_dir/models_15_15/rnn2 --results_save_path=./save_dir/results_15_15/rnn2  --input_type=gt
echo "SPLIT 3 ==> EP 15-15 "
python main.py --model=rnn --To=15 --Ta=15 --action=train --vid_list_file=./data/train.split3.bundle  --model_save_path=./save_dir/models_15_15/rnn3 --results_save_path=./save_dir/results_15_15/rnn3   
python main.py --model=rnn --To=15 --Ta=15 --action=predict  --vid_list_file=./data/test.split3.bundle  --model_save_path=./save_dir/models_15_15/rnn3 --results_save_path=./save_dir/results_15_15/rnn3   --input_type=gt
echo "SPLIT 4 ==> EP 15-15"
python main.py --model=rnn --To=15 --Ta=15 --action=train --vid_list_file=./data/train.split4.bundle  --model_save_path=./save_dir/models_15_15/rnn4 --results_save_path=./save_dir/results_15_15/rnn4 
python main.py --model=rnn --To=15 --Ta=15 --action=predict  --vid_list_file=./data/test.split4.bundle  --model_save_path=./save_dir/models_15_15/rnn4 --results_save_path=./save_dir/results_15_15/rnn4 --input_type=gt

echo "END"

echo "START "

echo "SPLIT 1 ==> EP 30-15 "
python main.py --model=rnn --To=30 --Ta=15 --action=train --vid_list_file=./data/train.split1.deb.bundle  --model_save_path=./save_dir/models_30_30/rnn1 --results_save_path=./save_dir/results_30_30/rnn1 
python main.py --model=rnn --To=30 --Ta=15 --action=predict  --vid_list_file=./data/test.split1.bundle --model_save_path=./save_dir/models_30_30/rnn1 --results_save_path=./save_dir/results_30_30/rnn1  --input_type=gt
echo "SPLIT 2 ==> EP 30-15"
python main.py --model=rnn --To=30 --Ta=15 --action=train --vid_list_file=./data/train.split2.bundle  --model_save_path=./save_dir/models_30_30/rnn2 --results_save_path=./save_dir/results_30_30/rnn2 
python main.py --model=rnn --To=30 --Ta=15 --action=predict  --vid_list_file=./data/test.split2.bundle  --model_save_path=./save_dir/models_30_30/rnn2 --results_save_path=./save_dir/results_30_30/rnn2  --input_type=gt
echo "SPLIT 3 ==> EP 30-15"
python main.py --model=rnn --To=30 --Ta=15 --action=train --vid_list_file=./data/train.split3.bundle  --model_save_path=./save_dir/models_30_30/rnn3 --results_save_path=./save_dir/results_30_30/rnn3   
python main.py --model=rnn --To=30 --Ta=15 --action=predict  --vid_list_file=./data/test.split3.bundle  --model_save_path=./save_dir/models_30_30/rnn3 --results_save_path=./save_dir/results_30_30/rnn3   --input_type=gt
echo "SPLIT 4 ==> EP 30-15"
python main.py --model=rnn --To=30 --Ta=15 --action=train --vid_list_file=./data/train.split4.bundle  --model_save_path=./save_dir/models_30_30/rnn4 --results_save_path=./save_dir/results_30_30/rnn4 
python main.py --model=rnn --To=30 --Ta=15 --action=predict  --vid_list_file=./data/test.split4.bundle  --model_save_path=./save_dir/models_30_30/rnn4 --results_save_path=./save_dir/results_30_30/rnn4 --input_type=gt

echo "END"

echo "START "

echo "SPLIT 1 ==> EP 30-30 "
python main.py --model=rnn --To=30 --Ta=30 --action=train --vid_list_file=./data/train.split1.deb.bundle  --model_save_path=./save_dir/models_30_15/rnn1 --results_save_path=./save_dir/results_30_15/rnn1 
python main.py --model=rnn --To=30 --Ta=30 --action=predict  --vid_list_file=./data/test.split1.bundle --model_save_path=./save_dir/models_30_15/rnn1 --results_save_path=./save_dir/results_30_15/rnn1  --input_type=gt
echo "SPLIT 2 ==> EP 30-30 "
python main.py --model=rnn --To=30 --Ta=30 --action=train --vid_list_file=./data/train.split2.bundle  --model_save_path=./save_dir/models_30_15/rnn2 --results_save_path=./save_dir/results_30_15/rnn2 
python main.py --model=rnn --To=30 --Ta=30 --action=predict  --vid_list_file=./data/test.split2.bundle  --model_save_path=./save_dir/models_30_15/rnn2 --results_save_path=./save_dir/results_30_15/rnn2  --input_type=gt
echo "SPLIT 3 ==> EP 30-30 "
python main.py --model=rnn --To=30 --Ta=30 --action=train --vid_list_file=./data/train.split3.bundle  --model_save_path=./save_dir/models_30_15/rnn3 --results_save_path=./save_dir/results_30_15/rnn3   
python main.py --model=rnn --To=30 --Ta=30 --action=predict  --vid_list_file=./data/test.split3.bundle  --model_save_path=./save_dir/models_30_15/rnn3 --results_save_path=./save_dir/results_30_15/rnn3   --input_type=gt
echo "SPLIT 4 ==> EP 30-30"
python main.py --model=rnn --To=30 --Ta=30 --action=train --vid_list_file=./data/train.split4.bundle  --model_save_path=./save_dir/models_30_15/rnn4 --results_save_path=./save_dir/results_30_15/rnn4 
python main.py --model=rnn --To=30 --Ta=30 --action=predict  --vid_list_file=./data/test.split4.bundle  --model_save_path=./save_dir/models_30_15/rnn4 --results_save_path=./save_dir/results_30_15/rnn4 --input_type=gt

echo "END"




