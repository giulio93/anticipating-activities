#!/bin/sh

python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn1 --results_save_path=./save_dir/results_GT_64/rnn1 --rnn_size=64   
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn2 --results_save_path=./save_dir/results_GT_64/rnn2 --rnn_size=64   
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn3 --results_save_path=./save_dir/results_GT_64/rnn3 --rnn_size=64   
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn4 --results_save_path=./save_dir/results_GT_64/rnn4 --rnn_size=64  
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn5 --results_save_path=./save_dir/results_GT_64/rnn5 --rnn_size=64  

python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn1 --results_save_path=./save_dir/results_GT_128/rnn1 --rnn_size=128 
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn2 --results_save_path=./save_dir/results_GT_128/rnn2 --rnn_size=128 
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn3 --results_save_path=./save_dir/results_GT_128/rnn3 --rnn_size=128 
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn4 --results_save_path=./save_dir/results_GT_128/rnn4 --rnn_size=128 
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn5 --results_save_path=./save_dir/results_GT_128/rnn5 --rnn_size=128 


python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn1 --results_save_path=./save_dir/results_GT_256/rnn1 --rnn_size=256
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn2 --results_save_path=./save_dir/results_GT_256/rnn2 --rnn_size=256
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn3 --results_save_path=./save_dir/results_GT_256/rnn3 --rnn_size=256
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn4 --results_save_path=./save_dir/results_GT_256/rnn4 --rnn_size=256
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn5 --results_save_path=./save_dir/results_GT_256/rnn5 --rnn_size=256

python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn1 --results_save_path=./save_dir/results_GT_128/rnn1 --rnn_size=512 
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn2 --results_save_path=./save_dir/results_GT_128/rnn2 --rnn_size=512 
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn3 --results_save_path=./save_dir/results_GT_128/rnn3 --rnn_size=512 
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn4 --results_save_path=./save_dir/results_GT_128/rnn4 --rnn_size=512 
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn5 --results_save_path=./save_dir/results_GT_128/rnn5 --rnn_size=512 

python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn1 --results_save_path=./save_dir/results_GT_64_3l/rnn1 --rnn_size=64  --num_layers=3   
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn2 --results_save_path=./save_dir/results_GT_64_3l/rnn2 --rnn_size=64  --num_layers=3 
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn3 --results_save_path=./save_dir/results_GT_64_3l/rnn3 --rnn_size=64  --num_layers=3 
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn4 --results_save_path=./save_dir/results_GT_64_3l/rnn4 --rnn_size=64  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn5 --results_save_path=./save_dir/results_GT_64_3l/rnn5 --rnn_size=64  --num_layers=3

python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn1 --results_save_path=./save_dir/results_GT_128_3l/rnn1 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn2 --results_save_path=./save_dir/results_GT_128_3l/rnn2 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn3 --results_save_path=./save_dir/results_GT_128_3l/rnn3 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn4 --results_save_path=./save_dir/results_GT_128_3l/rnn4 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn5 --results_save_path=./save_dir/results_GT_128_3l/rnn5 --rnn_size=128  --num_layers=3

python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn1 --results_save_path=./save_dir/results_GT_256_3l/rnn1 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn2 --results_save_path=./save_dir/results_GT_256_3l/rnn2 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn3 --results_save_path=./save_dir/results_GT_256_3l/rnn3 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn4 --results_save_path=./save_dir/results_GT_256_3l/rnn4 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn5 --results_save_path=./save_dir/results_GT_256_3l/rnn5 --rnn_size=256  --num_layers=3


python main.py --model=rnn --action=train --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn1 --results_save_path=./save_dir/results_GT_512_3l/rnn1 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn2 --results_save_path=./save_dir/results_GT_512_3l/rnn2 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn3 --results_save_path=./save_dir/results_GT_512_3l/rnn3 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn4 --results_save_path=./save_dir/results_GT_512_3l/rnn4 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=train --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn5 --results_save_path=./save_dir/results_GT_512_3l/rnn5 --rnn_size=512  --num_layers=3


#!/bin/sh

python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn1 --results_save_path=./save_dir/results_GT_64/rnn1 --rnn_size=64   
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn2 --results_save_path=./save_dir/results_GT_64/rnn2 --rnn_size=64   
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn3 --results_save_path=./save_dir/results_GT_64/rnn3 --rnn_size=64   
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn4 --results_save_path=./save_dir/results_GT_64/rnn4 --rnn_size=64  
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_64/rnn5 --results_save_path=./save_dir/results_GT_64/rnn5 --rnn_size=64  

python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn1 --results_save_path=./save_dir/results_GT_128/rnn1 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn2 --results_save_path=./save_dir/results_GT_128/rnn2 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn3 --results_save_path=./save_dir/results_GT_128/rnn3 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn4 --results_save_path=./save_dir/results_GT_128/rnn4 --rnn_size=128 
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_128/rnn5 --results_save_path=./save_dir/results_GT_128/rnn5 --rnn_size=128 


python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn1 --results_save_path=./save_dir/results_GT_256/rnn1 --rnn_size=256
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn2 --results_save_path=./save_dir/results_GT_256/rnn2 --rnn_size=256
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn3 --results_save_path=./save_dir/results_GT_256/rnn3 --rnn_size=256
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn4 --results_save_path=./save_dir/results_GT_256/rnn4 --rnn_size=256
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_256/rnn5 --results_save_path=./save_dir/results_GT_256/rnn5 --rnn_size=256

python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn1 --results_save_path=./save_dir/results_GT_128/rnn1 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn2 --results_save_path=./save_dir/results_GT_128/rnn2 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn3 --results_save_path=./save_dir/results_GT_128/rnn3 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn4 --results_save_path=./save_dir/results_GT_128/rnn4 --rnn_size=512 
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_512/rnn5 --results_save_path=./save_dir/results_GT_128/rnn5 --rnn_size=512 

python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn1 --results_save_path=./save_dir/results_GT_64_3l/rnn1 --rnn_size=64  --num_layers=3   
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn2 --results_save_path=./save_dir/results_GT_64_3l/rnn2 --rnn_size=64  --num_layers=3 
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn3 --results_save_path=./save_dir/results_GT_64_3l/rnn3 --rnn_size=64  --num_layers=3 
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn4 --results_save_path=./save_dir/results_GT_64_3l/rnn4 --rnn_size=64  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_64_3l/rnn5 --results_save_path=./save_dir/results_GT_64_3l/rnn5 --rnn_size=64  --num_layers=3

python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn1 --results_save_path=./save_dir/results_GT_128_3l/rnn1 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn2 --results_save_path=./save_dir/results_GT_128_3l/rnn2 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn3 --results_save_path=./save_dir/results_GT_128_3l/rnn3 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn4 --results_save_path=./save_dir/results_GT_128_3l/rnn4 --rnn_size=128  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_128_3l/rnn5 --results_save_path=./save_dir/results_GT_128_3l/rnn5 --rnn_size=128  --num_layers=3

python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn1 --results_save_path=./save_dir/results_GT_256_3l/rnn1 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn2 --results_save_path=./save_dir/results_GT_256_3l/rnn2 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn3 --results_save_path=./save_dir/results_GT_256_3l/rnn3 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn4 --results_save_path=./save_dir/results_GT_256_3l/rnn4 --rnn_size=256  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_256_3l/rnn5 --results_save_path=./save_dir/results_GT_256_3l/rnn5 --rnn_size=256  --num_layers=3


python main.py --model=rnn --action=predict --vid_list_file=./data/split1.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn1 --results_save_path=./save_dir/results_GT_512_3l/rnn1 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split2.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn2 --results_save_path=./save_dir/results_GT_512_3l/rnn2 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split3.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn3 --results_save_path=./save_dir/results_GT_512_3l/rnn3 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split4.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn4 --results_save_path=./save_dir/results_GT_512_3l/rnn4 --rnn_size=512  --num_layers=3
python main.py --model=rnn --action=predict --vid_list_file=./data/split5.train --input_type=gt --model_save_path=./save_dir/models_GT_512_3l/rnn5 --results_save_path=./save_dir/results_GT_512_3l/rnn5 --rnn_size=512  --num_layers=3
