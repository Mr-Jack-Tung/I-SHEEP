# export MODEL_DIR="/ML-A100/team/mm/eamon/self_instruction/seed_ppl/models/merged_iter1_10k_filter_prompt_eval_score_qwen_like_2epoch"
# export TOKENIZERS_PARALLELISM=True
# model_path=${MODEL_DIR}
# outpath=outputs/seed_ppl_10k_iter2.jsonl

# export MODEL_DIR="/ML-A100/team/mm/eamon/self_instruction/seed_ppl/models/merged_iter2_2epoch_10k_filter_by_prompt_eval_score"
# export TOKENIZERS_PARALLELISM=True
# model_path=${MODEL_DIR}
# outpath=outputs/seed_ppl_10k_iter3.jsonl

# export MODEL_DIR="/ML-A100/team/mm/eamon/self_instruction/seed_ppl/models/merged_on_base_iter2_2epoch_d1"
# export TOKENIZERS_PARALLELISM=True
# model_path=${MODEL_DIR}
# cd /ML-A100/team/mm/eamon/self_instruction/seed_ppl
# outpath=outputs/seed_ppl_10k_iter2_on_base.jsonl

export MODEL_DIR="/ML-A100/team/mm/eamon/self_instruction/seed_ppl/models/merged_one_step_iter2_2epoch_d0_d1"
export TOKENIZERS_PARALLELISM=True
model_path=${MODEL_DIR}
cd /ML-A100/team/mm/eamon/self_instruction/seed_ppl
outpath=outputs/seed_ppl_10k_iter2_one_step.jsonl

if [ ! -f "$outpath" ]; then
  # 文件不存在，创建文件
  touch "$outpath"
fi

python3 context_generate_iter2.py \
    --model $model_path \
    --seed_task_path seed_tasks_hf65_with_cluster_id.jsonl \
    --output $outpath \
    --num_generation 10000 \
    --gpus 8  \
    --batch_size 100 \
    --origin_samples 3 \
    --sample_methods 'inverse' \
    --form 'ppl'