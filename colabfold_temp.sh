#!/bin/bash

# Script  name      : colabfold_temp.sh
#
# Author            : Dawid Warmus
#
# Purpose           : Submit protein for prediction to ColabFold in Ubelix

# Parameters for gpu -> gres and mem-per-cpu (remember colabfold is able to work only on one gpu!)
# rtx3090 (gpu:rtx3090:1) | required mem = work in progress it was working with 12G | max length probably 1000-1400 aa
# tesla p100 (gpu:teslap100:1) | required mem = 16G | max length probably ~2000 aa

# REMEMBER TO SET TIME
# time values depend on the length of the protein
# <500 -> up to 3h | 500-1500 -> 3-16h | 1500-2000 -> up to 36h probably

# !!!!!!!!!!!! MAKE SURE YOU FILLED UP ALL <> PLACEHOLDERS !!!!!!!!!!!!

#SBATCH --job-name="Template"
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

output_dir=<PATH_TO_OUTPUT_DIR>

input=<PATH_TO_INPUT_DIR>

# env (uncomment if you did not put it in .bashrc)
#export PATH="<PATH_TO_DIR_COLABFOLD-CONDA>/colabfold-conda/bin:$PATH"

# colab_fold start (to learn more about flags go to https://github.com/YoshitakaMo/localcolabfold)
colabfold_batch --templates --amber $input $output_dir
