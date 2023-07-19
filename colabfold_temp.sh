#!/bin/bash

# Script  name      : colabfold_temp.sh
#
# Author            : Dawid Warmus
#
# Purpose           : Submit protein for prediction to ColabFold in Ubelix

# Parameters for gpu -> gres and mem-per-cpu (remember colabfold is able to work only on one GPU!)
# rtx3090 (gpu:rtx3090:1) | required mem = 12G - 16G | max length probably 1000-1400 aa
# tesla p100 (gpu:teslap100:1) | required mem = 16G - 20G | max length probably ~2000 aa
# Please make sure you use the lowest possible values 

# REMEMBER TO SET TIME (format hh:mm:ss -> 03:00:00 = 3h)
# Time values depend on the length of the protein
# <500 -> up to 3h | 500-1500 -> 3-16h | 1500-2000 -> up to 36h 

# !!!!!!!!!!!! MAKE SURE YOU FILLED UP ALL <> PLACEHOLDERS !!!!!!!!!!!!
# (you have to also delete all the placeholders)

#SBATCH --job-name="<JOB NAME>"
#SBATCH --time=<TIME>
#SBATCH --mem-per-cpu=<MEM>
#SBATCH --partition=gpu
#SBATCH --gres=gpu:<GPU>:1
#SBATCH --output=<PATH_TO_OUTPUT_DIR>/colab_out_%j.out
#SBATCH --error=<PATH_TO_ERROR_DIR>/colab_err_%j.err

  
# load mod
module load Anaconda3
module load cuDNN/8.2.1.32-CUDA-11.3.1

# INPUT (fasta_file) | OUTPUT_DIR 

job_name=${SLURM_JOB_NAME#--job-name=}
job_name=$(echo $job_name | tr -d '"')

output_dir="<PATH_TO_OUTPUT_DIR>/$job_name"
mkdir -p $output_dir

input=<PATH_TO_INPUT_DIR>

# env (comment or delete it if you put it in .bashrc)
export PATH="<PATH_TO_DIR_COLABFOLD-CONDA>/colabfold-conda/bin:$PATH"

# colab_fold start (to learn more about flags go to https://github.com/YoshitakaMo/localcolabfold)
colabfold_batch --templates --amber $input $output_dir
