#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expand_array_kernel(const float *src_gpu, float *dst_gpu, int current_size, int groups) 
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Index out of bounds check
    if (index >= current_size) return; 

    // Unroll loop to optimize memory writes
    #pragma unroll
    for (int i = 0; i < groups; ++i) {
        dst_gpu[index + i * current_size] = src_gpu[index];
    }
}