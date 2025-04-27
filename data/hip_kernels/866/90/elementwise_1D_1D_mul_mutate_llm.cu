#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul_mutate(float* in1, float* in2, float* out, int size) {
    // Calculate thread id once
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Adjust loop to avoid boundary checks in each iteration
    for (; tid < size; tid += stride) {
        out[tid] += in1[tid] * in2[tid];
    }
}