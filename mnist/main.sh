#!/bin/bash
#
#$ -j y
#$ -S /bin/bash
#$ -cwd

## the next line selects the partition/queue
#SBATCH -p model3

## the next line selects the number of nodes
#SBATCH -N 1

## the next line selects the number of CPUs
#SBATCH -n 2

## the next line selects the memory size
#SBATCH --mem=16G

## the next line selects the walltime
#SBATCH -t 24:00

## select GPU
#SBATCH --gres=gpu:1

cat << EOF > script.sh
#!/bin/bash

python main.py
EOF

singularity exec --nv /containers/images/u1604-cuda-9.1_pytorch.img bash ./script.sh

rm -fv ./script.sh
