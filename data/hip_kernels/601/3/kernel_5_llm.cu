#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_5(int *new_data, int *data)
{
    int _tid_ = threadIdx.x + blockIdx.x * blockDim.x;

    // Exit early if the thread index exceeds the array bounds
    if (_tid_ >= 10000000) return;

    // Precompute division result for efficiency, using bitwise operations for division
    int idx_2 = (_tid_ >> 1) % 500;

    // Perform the computation and write the result
    new_data[_tid_] = (data[_tid_] + idx_2) % 13377;
}