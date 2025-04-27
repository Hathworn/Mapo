#!/bin/bash

# 设置输出目录
OUTPUT_DIR="hipprof_results"
mkdir -p "$OUTPUT_DIR"

# NI 和 DIM_THREAD_BLOCK_X, DIM_THREAD_BLOCK_Y 的配置
NI_values=(256 512 1024 2048 4096 8192 16384 32768)
BLOCKS_X_values=(1 2 4 8 16 32 64 128 256)
BLOCKS_Y_values=(256 128 64 32 16 8 4 2 1)

# 遍历 hip_kernels 目录下所有的 main.cu 文件（假设两级目录）
for main_cu in hip_kernels/*/*/main.cu; do
  echo "处理文件: $main_cu"
  # 提取两级目录的名称，用于构造唯一的执行文件名和结果文件名
  parent_dir1=$(basename "$(dirname "$main_cu")")
  parent_dir2=$(basename "$(dirname "$(dirname "$main_cu")")")
  
  # 对每个 main.cu 文件，遍历所有测试配置
  for ni in "${NI_values[@]}"; do
    nj=$ni
    for i in "${!BLOCKS_X_values[@]}"; do
      dim_x="${BLOCKS_X_values[$i]}"
      dim_y="${BLOCKS_Y_values[$i]}"
      
      # 生成临时修改的头文件
      cp atax.cuh atax_temp.cuh
      sed -i "s/#define NX .*/#define NX $ni/" atax_temp.cuh
      sed -i "s/#define NY .*/#define NY $nj/" atax_temp.cuh
      sed -i "s/#define DIM_THREAD_BLOCK_X .*/#define DIM_THREAD_BLOCK_X $dim_x/" atax_temp.cuh
      sed -i "s/#define DIM_THREAD_BLOCK_Y .*/#define DIM_THREAD_BLOCK_Y $dim_y/" atax_temp.cuh
      
      # 构造独特的可执行文件名称
      exec_name="run_${parent_dir2}_${parent_dir1}_${ni}_${dim_x}_${dim_y}"
      hipcc -O3 "$main_cu" -I. -I$(pwd) -o "$exec_name"
      
      # 定义结果文件名（可根据需要调整文件命名规则）
      result_file_pmc="$OUTPUT_DIR/result_${parent_dir2}_${parent_dir1}_${ni}_${nj}_${dim_x}_${dim_y}_pmc.txt"
      result_file_pmc_csv="$OUTPUT_DIR/result_${parent_dir2}_${parent_dir1}_${ni}_${nj}_${dim_x}_${dim_y}_pmc.csv"
      
      # 使用 hipprof 工具运行程序，并重命名输出结果文件
      hipprof --pmc --pmc-type 2 ./"$exec_name"
      generated_file=$(ls pmc_results_*.txt)
      mv "$generated_file" "$result_file_pmc"
      
      hipprof --pmc --pmc-type 3 ./"$exec_name"
      generated_file=$(ls pmc_results_*.csv)
      mv "$generated_file" "$result_file_pmc_csv"
      
      # 清理临时文件和可执行文件
      rm -f atax_temp.cuh "$exec_name"
    done
  done
done

echo "所有测试完成，结果已保存到 $OUTPUT_DIR 目录中。"
