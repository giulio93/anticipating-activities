#!/bin/sh
source /venv/bin/activate

# echo "START "
  
echo "SPLIT 1"
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data_salad/split1.train  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn1 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn1 
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data_salad/split1.test --model_save_path=./save_dir/salad/models_6_8_0.50/rnn1 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn1   --input_type=gt
echo "SPLIT 2"
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data_salad/split2.train  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn2 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn2 
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data_salad/split2.test  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn2 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn2  --input_type=gt
echo "SPLIT 3"
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data_salad/split3.train  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn3 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn3   
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data_salad/split3.test  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn3 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn3   --input_type=gt
echo "SPLIT 4"
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data_salad/split4.train  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn4 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn4 
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data_salad/split4.test  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn4 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn4  --input_type=gt
echo "SPLIT 5"
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=train --vid_list_file=./data_salad/split5.train  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn5 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn5
python main_s.py --model=rnn --S_enc=6 --S_ant=8 --beta=0.50 --action=predict  --vid_list_file=./data_salad/split5.test  --model_save_path=./save_dir/salad/models_6_8_0.50/rnn5 --results_save_path=./save_dir/salad/results_6_8_0.50/rnn5  --input_type=gt

# echo "END"

echo "SPLIT 1"
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred0_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred1_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred2_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred3_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred4_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred5_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred6_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn1/obs6-pred7_target
echo "SPLIT 2"
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred0_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred1_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred2_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred3_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred4_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred5_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred6_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn2/obs6-pred7_target
echo "SPLIT 3"
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred0_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred1_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred2_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred3_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred4_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred5_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred6_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn3/obs6-pred7_target
echo "SPLIT 4"
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred0_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred1_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred2_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred3_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred4_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred5_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred6_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn4/obs6-pred7_target
echo "SPLIT 5"
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred0 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred0_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred1 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred1_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred2 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred2_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred3 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred3_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred4 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred4_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred5 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred5_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred6 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred6_target
python eval_EPICII.py  --mapping_file=./data_salad/mapping.txt --recog_dir=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred7 --ground_truth_path=./save_dir/salad/results_6_8_0.50/rnn5/obs6-pred7_target