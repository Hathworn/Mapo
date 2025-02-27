#!/bin/bash
# 用法: ./run_gpu.sh <设备ID>

# 固定参数
FIXED_MATRIX_LEN=30     # 固定矩阵长度
FIXED_RUN_TIMES=7       # 固定运行次数
FIXED_COMPILER_FLAGS="-O3 --offload-arch=gfx906 --gpu-max-threads-per-block=1024" # 固定编译选项

# 校验输入参数
if [ $# -ne 1 ] || ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "错误：必须指定一个数字类型的设备ID"
    echo "用法: $0 <设备ID>"
    exit 1
fi

DEVICE_ID=$1

# 执行命令
echo "启动 GPU 任务 - 设备ID: $DEVICE_ID"
python3 src/multi_runtimes.py \
    $DEVICE_ID \
    $FIXED_MATRIX_LEN \
    $FIXED_RUN_TIMES \
    "$FIXED_COMPILER_FLAGS"