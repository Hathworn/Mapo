#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_HeatReduction(float *res, float *result) {
    extern __shared__ float sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory
    sdata[tid] = res[index];
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        result[blockIdx.x] = sdata[0];
    }
}