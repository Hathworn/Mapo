# LS-CAT-HIP
LS-CAT数据集移植到HIP

# 东方超算运行收集数据集
## 1.slurm脚本
使用16个节点，64个GPU同时运行，半小时左右
```
#!/bin/bash
#SBATCH -J LS-CAT
#SBATCH -p normal
#SBATCH -N 16                 # 申请2个节点
#SBATCH --ntasks-per-node=4   # 每个节点上启动4个任务
#SBATCH --cpus-per-task=5     # 每个任务分配5个CPU核心
#SBATCH --mem=80G
#SBATCH --gres=dcu:4          # 每个节点申请4块GPU
#SBATCH -o test.%j.o
#SBATCH -e test.%j.e

# 清理并加载模块
module purge
module load compiler/rocm/dtk/24.04.1
module load compiler/devtoolset/11.2.1
module load compiler/cmake/3.24.1
export HIP_PLATFORM=amd

# 启动并行任务，每个任务绑定到不同的GPU
srun ./runner.sh &
wait
```
## 2.python脚本执行
```
#!/bin/bash
# 用法: ./run_gpu.sh

# 固定参数
FIXED_MATRIX_LEN=30     # 固定矩阵长度
FIXED_RUN_TIMES=7       # 固定运行次数
FIXED_COMPILER_FLAGS="-O3 --offload-arch=gfx906 --gpu-max-threads-per-block=1024" # 固定编译选项

# 禁用core文件生成
ulimit -c 0

# 计算当前任务的设备ID
NODE_ID=$(hostname | awk -F'-' '{print $NF}')   # 获取节点ID (例如: node-1, node-2)
# TASK_ID=$SLURM_ARRAY_TASK_ID  # 获取任务ID，SLURM自动分配
TASK_ID=$SLURM_PROCID
# 每个节点上最多有 4 个GPU，所以我们取任务ID对4取模来确保设备ID在0-3之间
DEVICE_ID=$((TASK_ID % 4))  # 取模确保每个节点只使用 0-3 号 GPU

echo "启动 GPU 任务 - 节点ID: $NODE_ID 任务ID: $TASK_ID 设备ID: $DEVICE_ID"

# 设置环境变量绑定指定GPU
export ROCR_VISIBLE_DEVICES=$DEVICE_ID

# 启动任务，传递设备ID和固定参数
python3 src/multi_runtimes.py \
    $DEVICE_ID \
    $FIXED_MATRIX_LEN \
    $FIXED_RUN_TIMES \
    "$FIXED_COMPILER_FLAGS"
```
