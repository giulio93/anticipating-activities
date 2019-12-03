#!/bin/sh
source /venv/bin/activate

# echo "START "
  
echo "SPLIT 1"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data/train.split1.bundle --model_save_path=./save_dir/models_6_8_0.50/rnn1 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn1 
python main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data/test.split1.bundle --model_save_path=./save_dir/models_6_8_0.50/rnn1 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn1  --decoded_path=./data/decoded/split1
echo "SPLIT 2"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data/train.split2.bundle --model_save_path=./save_dir/models_6_8_0.50/rnn2 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn2 
python main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data/test.split2.bundle  --model_save_path=./save_dir/models_6_8_0.50/rnn2 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn2  --decoded_path=./data/decoded/split2
echo "SPLIT 3"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data/train.split3.bundle --model_save_path=./save_dir/models_6_8_0.50/rnn3 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn3   
python main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data/test.split3.bundle  --model_save_path=./save_dir/models_6_8_0.50/rnn3 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn3   --decoded_path=./data/decoded/split3
echo "SPLIT 4"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data/train.split4.bundle --model_save_path=./save_dir/models_6_8_0.50/rnn4 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn4 
python main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data/test.split4.bundle  --model_save_path=./save_dir/models_6_8_0.50/rnn4 --results_save_path=./save_dir/results_6_8_0.50_dec/rnn4  --decoded_path=./data/decoded/split4


# echo "END"

echo "SPLIT 1"
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred0 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred1 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred2 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred3 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred4 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred5 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred6 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred7 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn1/obs6-pred7_target
echo "END"
echo "SPLIT 2"
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred0 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred1 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred2 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred3 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred4 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred5 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred6 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred7 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn2/obs6-pred7_target
echo "END"
echo "SPLIT 3"
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred0 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred1 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred2 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred3 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred4 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred5 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred6 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred7 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn3/obs6-pred7_target
echo "SPLIT 4"
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred0 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred1 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred2 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred3 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred4 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred5 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred6 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred7 --ground_truth_path=./save_dir/results_6_8_0.50_dec/rnn4/obs6-pred7_target
echo "END"