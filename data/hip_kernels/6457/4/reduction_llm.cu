#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int* input, int* output) {
    __shared__ int tmp[TPB];
    
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    
    tmp[tid] = input[index];
    
    __syncthreads();
    
    // Unrolling the loop for better performance
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            tmp[tid] += tmp[tid + stride];
        }
        __syncthreads();
    }
    
    if (tid == 0) {
        output[blockIdx.x] = tmp[0];
    }
}