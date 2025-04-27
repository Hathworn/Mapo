#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    extern __shared__ float shared_sum[]; // Shared memory allocation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    shared_sum[threadIdx.x] = 0.0f;
    __syncthreads(); // Synchronize to ensure shared memory initialization

    for (int k = threadIdx.x; k < n; k += blockDim.x) {
        shared_sum[threadIdx.x] += x[k * groups + i];
    }
    
    __syncthreads(); // Synchronize the threads for reduction

    // Parallel reduction within block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Store the result in the output array
    if (threadIdx.x == 0) {
        sum[i] = shared_sum[0];
    }
}