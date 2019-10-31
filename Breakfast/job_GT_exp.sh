#!/bin/sh

python main.py --model=rnn --action=predict --vid_list_file=./data/train.split1.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn1 --results_save_path=./save_dir/results_GT_64/rnn1 --rnn_size=64   
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split2.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn2 --results_save_path=./save_dir/results_GT_64/rnn2 --rnn_size=64   
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split3.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn3 --results_save_path=./save_dir/results_GT_64/rnn3 --rnn_size=64   
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split4.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn4 --results_save_path=./save_dir/results_GT_64/rnn4 --rnn_size=64  
--input_type=gt
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split1.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn1 --results_save_path=./save_dir/results_GT_128/rnn1 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split2.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn2 --results_save_path=./save_dir/results_GT_128/rnn2 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split3.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn3 --results_save_path=./save_dir/results_GT_128/rnn3 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split4.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn4 --results_save_path=./save_dir/results_GT_128/rnn4 --rnn_size=128 
--input_type=gt
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split1.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn1 --results_save_path=./save_dir/results_GT_512/rnn1 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split2.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn2 --results_save_path=./save_dir/results_GT_512/rnn2 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split3.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn3 --results_save_path=./save_dir/results_GT_512/rnn3 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split4.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn4 --results_save_path=./save_dir/results_GT_512/rnn4 --rnn_size=512 
--input_type=gt
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split1.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn1 --results_save_path=./save_dir/results_GT_64_3l/rnn1 --rnn_size=64  --num_layers=3   
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split2.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn2 --results_save_path=./save_dir/results_GT_64_3l/rnn2 --rnn_size=64  --num_layers=3 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split3.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn3 --results_save_path=./save_dir/results_GT_64_3l/rnn3 --rnn_size=64  --num_layers=3 
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split4.bundle --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn4 --results_save_path=./save_dir/results_GT_64_3l/rnn4 --rnn_size=64  --num_layers=3
--input_type=gt
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split1.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn1 --results_save_path=./save_dir/results_GT_128_3l/rnn1 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split2.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn2 --results_save_path=./save_dir/results_GT_128_3l/rnn2 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split3.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn3 --results_save_path=./save_dir/results_GT_128_3l/rnn3 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split4.bundle --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn4 --results_save_path=./save_dir/results_GT_128_3l/rnn4 --rnn_size=128  --num_layers=3
--input_type=gt
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split1.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn1 --results_save_path=./save_dir/results_GT_512_3l/rnn1 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split2.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn2 --results_save_path=./save_dir/results_GT_512_3l/rnn2 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split3.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn3 --results_save_path=./save_dir/results_GT_512_3l/rnn3 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/train.split4.bundle --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn4 --results_save_path=./save_dir/results_GT_512_3l/rnn4 --rnn_size=512  --num_layers=3
