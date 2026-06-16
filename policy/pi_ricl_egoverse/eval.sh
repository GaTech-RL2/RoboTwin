#!/bin/bash
# Evaluate an EgoVerse PIRicl (pi0.5) checkpoint on a RoboTwin task (cluster/GPU).
# Usage: bash policy/pi_ricl_egoverse/eval.sh <task_name> <task_config> <egoverse_ckpt> <model_name> <seed> <gpu_id>
# Set bank_root / bank_index_dir / quantiles_path in deploy_policy.yml (or add --overrides).

policy_name=pi_ricl_egoverse
task_name=${1}
task_config=${2}
egoverse_checkpoint=${3}
model_name=${4}
seed=${5}
gpu_id=${6}

export CUDA_VISIBLE_DEVICES=${gpu_id}
echo -e "\033[33mgpu id (to use): ${gpu_id}\033[0m"

cd ../.. # move to RoboTwin root

PYTHONWARNINGS=ignore::UserWarning \
python script/eval_policy.py --config policy/$policy_name/deploy_policy.yml \
    --overrides \
    --task_name ${task_name} \
    --task_config ${task_config} \
    --egoverse_checkpoint ${egoverse_checkpoint} \
    --model_name ${model_name} \
    --ckpt_setting ${model_name} \
    --seed ${seed} \
    --policy_name ${policy_name}
