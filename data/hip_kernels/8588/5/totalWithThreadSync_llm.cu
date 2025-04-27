```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void totalWithThreadSync(float *input, float *output, int len) {
    // Improved reduction kernel
    extern __shared__ float sdata[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load shared memory/cache line to reduce global memory access
    sdata[tid] = (i < len) ? input[i] : 0.0f;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int j = blockDim.x / 2; j > 0; j >>= 1) {
        if (tid < j) {
            sdata[tid] += sdata[tid + j];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        output[blockIdx.x] = sdata[0];
    }
}