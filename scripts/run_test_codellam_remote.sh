#!/bin/bash
#SBATCH -J fine-tune_vul_data --mem=40GB --gpus=1  --account=l_unjie
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=ljj790225650@gmail.com 

# source /etc/profile.d/modules.sh
# module load anaconda/3.2023.09
# module load cuda/12.2.2
# source activate latest_peft
# nvidia-smi
# python3 -m wandb login 722f6e2de6b117fb0368a2a882b866fed379eb48
# WANDB__SERVICE_WAIT=300
CUDA_VISIBLE_DEVICES=0 python3 ../main.py \
--model_name_or_path "codellama/CodeLlama-7b-hf" \
--dataset "codealpaca" \
--tuning_method "prompt-tuning" \
--batch_size 1 \
--gradient_accumulation_steps 1 \
--do_train