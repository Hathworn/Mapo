#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotProduct_CUDA_double(double *sum, int size, double *vector1, double *vector2){
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the blocks

    // Use shared memory to leverage memory coalescing
    __shared__ double sharedSum[256]; // 256 is exemplary, should match blockDim.x

    double temp = 0.0;
    if (idx < size) {
        temp = (vector2[idx]) * (vector1[idx]);
    }
    sharedSum[threadIdx.x] = temp;

    __syncthreads();

    // Perform reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        atomicAdd(&sum[0], sharedSum[0]);
    }
}