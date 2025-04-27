#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_sum(const float* src, float* sum, float *global_mem, const int n) {
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int local_tid = threadIdx.x;

    // load input into __shared__ memory
    float x = (tid < n) ? src[tid] : 0.0f;  // Use ternary to avoid branch divergence
    global_mem[local_tid] = x;
    __syncthreads();

    // contiguous range pattern
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (local_tid < offset) {
            global_mem[local_tid] += global_mem[local_tid + offset];
        }
        __syncthreads();  // Synchronize at the end of each reduction step
    }

    // thread 0 writes the final result
    if (local_tid == 0) {
        sum[blockIdx.x] = global_mem[0];
    }
}