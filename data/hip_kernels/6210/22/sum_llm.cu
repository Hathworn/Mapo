#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(const float *input, float *output, int numElements) {
    // Use shared memory for intermediate sums
    extern __shared__ float sharedData[];
    int tid = threadIdx.x;
    int idx = blockIdx.x * blockDim.x + tid;
    
    sharedData[tid] = (idx < numElements) ? input[idx] : 0.f;
    __syncthreads();

    // Reduce sum in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sharedData[tid] += sharedData[tid + stride];
        }
        __syncthreads();
    }

    // Write result of this block's reduction to output
    if (tid == 0) {
        atomicAdd(output, sharedData[0]);
    }
}