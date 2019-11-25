#!/bin/sh
source /venv/bin/activate

# echo "START "
  
echo "SPLIT 1"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=train --vid_list_file=./data_salad/split1.train  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn1 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn1 
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=predict  --vid_list_file=./data_salad/split1.test --model_save_path=./save_dir/salad/models_6_8_0.25/rnn1 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn1  --input_type=gt
echo "SPLIT 2"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=train --vid_list_file=./data_salad/split2.train  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn2 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn2 
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=predict  --vid_list_file=./data_salad/split2.test  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn2 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn2  --input_type=gt
echo "SPLIT 3"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=train --vid_list_file=./data_salad/split3.train  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn3 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn3   
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=predict  --vid_list_file=./data_salad/split3.test  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn3 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn3   --input_type=gt
echo "SPLIT 4"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=train --vid_list_file=./data_salad/split4.train  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn4 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn4 
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=predict  --vid_list_file=./data_salad/split4.test  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn4 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn4 --input_type=gt
echo "SPLIT 4"
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=train --vid_list_file=./data_salad/split5.train  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn4 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn4 
python3 main.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.25 --action=predict  --vid_list_file=./data_salad/split5.test  --model_save_path=./save_dir/salad/models_6_8_0.25/rnn4 --results_save_path=./save_dir/salad/results_6_8_0.25/rnn4 --input_type=gt

# echo "END"

echo "SPLIT 1"
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn1/obs6-pred7_target
echo "SPLIT 2"
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn2/obs6-pred7_target
echo "SPLIT 3"
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn3/obs6-pred7_target
echo "SPLIT 4"
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred0_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred1_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred2_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred3_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred4_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred5_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred6_target
python eval_EPICII.py --recog_dir=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.25/rnn4/obs6-pred7_target
