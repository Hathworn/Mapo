##
Code Optimization Guided by GPU Memory Access Performance Modeling
#### Store all kernel functions
`data/hip_kernels`
#### The table contains the names of all kernel functions, the names of input parameters, and the relative paths. All the subsequent running scripts are traversed based on this table.
`data/kernel_list.csv`
#### The python scripts for running and generating files are all here.
`src/`
#### Optimization suggestions
`euclidean_kernel_llm.txt`
#### Original kernel function
`euclidean_kernel.cu`
#### Optimized kernel function
`euclidean_kernel_llm.cu`
#### The main function is used to execute the kernel function
`main.cu`
#### After optimization, the main function only modified the call file
`main_llm.cu`
#### Executable file
`run`
#### The optimized executable file
`run_llm`
#### The IR file
`euclidean_kernel_device.ll`
#### The dynamic data results run using hipprof
`hipprof_results/`
