#!/bin/sh



python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn1 --results_save_path=./save_dir/results_decoded_64/rnn1 --rnn_size=64   --decoded_path=./data/decoded/split1   
python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn2 --results_save_path=./save_dir/results_decoded_64/rnn2 --rnn_size=64    --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn3 --results_save_path=./save_dir/results_decoded_64/rnn3 --rnn_size=64    --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn4 --results_save_path=./save_dir/results_decoded_64/rnn4 --rnn_size=64   --decoded_path=./data/decoded/split4
--input_type=decoded
python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn1 --results_save_path=./save_dir/results_decoded_128/rnn1 --rnn_size=128  --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn2 --results_save_path=./save_dir/results_decoded_128/rnn2 --rnn_size=128  --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn3 --results_save_path=./save_dir/results_decoded_128/rnn3 --rnn_size=128  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn4 --results_save_path=./save_dir/results_decoded_128/rnn4 --rnn_size=128  --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn1 --results_save_path=./save_dir/results_decoded_512/rnn1 --rnn_size=512  --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn2 --results_save_path=./save_dir/results_decoded_512/rnn2 --rnn_size=512  --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn3 --results_save_path=./save_dir/results_decoded_512/rnn3 --rnn_size=512  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn4 --results_save_path=./save_dir/results_decoded_512/rnn4 --rnn_size=512  --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn1 --results_save_path=./save_dir/results_decoded_64_3l/rnn1 --rnn_size=64  --num_layers=3   --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn2 --results_save_path=./save_dir/results_decoded_64_3l/rnn2 --rnn_size=64  --num_layers=3  --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn3 --results_save_path=./save_dir/results_decoded_64_3l/rnn3 --rnn_size=64  --num_layers=3  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn4 --results_save_path=./save_dir/results_decoded_64_3l/rnn4 --rnn_size=64  --num_layers=3 --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn1 --results_save_path=./save_dir/results_decoded_128_3l/rnn1 --rnn_size=128  --num_layers=3  --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn2 --results_save_path=./save_dir/results_decoded_128_3l/rnn2 --rnn_size=128  --num_layers=3 --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn3 --results_save_path=./save_dir/results_decoded_128_3l/rnn3 --rnn_size=128  --num_layers=3 --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn4 --results_save_path=./save_dir/results_decoded_128_3l/rnn4 --rnn_size=128  --num_layers=3 --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=train --vid_list_file=./data/train.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn1 --results_save_path=./save_dir/results_decoded_512_3l/rnn1 --rnn_size=512  --num_layers=3   --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn2 --results_save_path=./save_dir/results_decoded_512_3l/rnn2 --rnn_size=512  --num_layers=3  --decoded_path=./data/decoded/split2
python main.py --model=rnn --action=train --vid_list_file=./data/train.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn3 --results_save_path=./save_dir/results_decoded_512_3l/rnn3 --rnn_size=512  --num_layers=3  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=train --vid_list_file=./data/train.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn4 --results_save_path=./save_dir/results_decoded_512_3l/rnn4 --rnn_size=512  --num_layers=3  --decoded_path=./data/decoded/split4







python main.py --model=rnn --action=predict--vid_list_file=./data/test.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn1 --results_save_path=./save_dir/results_decoded_64/rnn1 --rnn_size=64   --decoded_path=./data/decoded/split1   
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn2 --results_save_path=./save_dir/results_decoded_64/rnn2 --rnn_size=64    --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn3 --results_save_path=./save_dir/results_decoded_64/rnn3 --rnn_size=64    --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64/rnn4 --results_save_path=./save_dir/results_decoded_64/rnn4 --rnn_size=64   --decoded_path=./data/decoded/split4
--input_type=decoded
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn1 --results_save_path=./save_dir/results_decoded_128/rnn1 --rnn_size=128  --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn2 --results_save_path=./save_dir/results_decoded_128/rnn2 --rnn_size=128  --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn3 --results_save_path=./save_dir/results_decoded_128/rnn3 --rnn_size=128  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128/rnn4 --results_save_path=./save_dir/results_decoded_128/rnn4 --rnn_size=128  --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn1 --results_save_path=./save_dir/results_decoded_512/rnn1 --rnn_size=512  --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn2 --results_save_path=./save_dir/results_decoded_512/rnn2 --rnn_size=512  --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn3 --results_save_path=./save_dir/results_decoded_512/rnn3 --rnn_size=512  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512/rnn4 --results_save_path=./save_dir/results_decoded_512/rnn4 --rnn_size=512  --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn1 --results_save_path=./save_dir/results_decoded_64_3l/rnn1 --rnn_size=64  --num_layers=3   --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn2 --results_save_path=./save_dir/results_decoded_64_3l/rnn2 --rnn_size=64  --num_layers=3  --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn3 --results_save_path=./save_dir/results_decoded_64_3l/rnn3 --rnn_size=64  --num_layers=3  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_64_3l/rnn4 --results_save_path=./save_dir/results_decoded_64_3l/rnn4 --rnn_size=64  --num_layers=3 --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn1 --results_save_path=./save_dir/results_decoded_128_3l/rnn1 --rnn_size=128  --num_layers=3  --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn2 --results_save_path=./save_dir/results_decoded_128_3l/rnn2 --rnn_size=128  --num_layers=3 --decoded_path=./data/decoded/split2 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn3 --results_save_path=./save_dir/results_decoded_128_3l/rnn3 --rnn_size=128  --num_layers=3 --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_128_3l/rnn4 --results_save_path=./save_dir/results_decoded_128_3l/rnn4 --rnn_size=128  --num_layers=3 --decoded_path=./data/decoded/split4 
--input_type=decoded
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split1.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn1 --results_save_path=./save_dir/results_decoded_512_3l/rnn1 --rnn_size=512  --num_layers=3   --decoded_path=./data/decoded/split1 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split2.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn2 --results_save_path=./save_dir/results_decoded_512_3l/rnn2 --rnn_size=512  --num_layers=3  --decoded_path=./data/decoded/split2
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split3.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn3 --results_save_path=./save_dir/results_decoded_512_3l/rnn3 --rnn_size=512  --num_layers=3  --decoded_path=./data/decoded/split3 
python main.py --model=rnn --action=predict--vid_list_file=./data/test.split4.bundle --input_type=decoded --model_save_path=./save_dir/models_decoded_512_3l/rnn4 --results_save_path=./save_dir/results_decoded_512_3l/rnn4 --rnn_size=512  --num_layers=3  --decoded_path=./data/decoded/split4 
