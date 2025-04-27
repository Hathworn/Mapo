```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot(float* a, float* b, float* c) {
    __shared__ float cache[threadsPerBlock];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int cacheIndex = threadIdx.x;

    float temp = 0.0f;
    // Optimize loop by ensuring warp divergence is minimized
    for (int index = tid; index < N; index += blockDim.x * gridDim.x) {
        temp += a[index] * b[index];
    }

    // Set the cache values
    cache[cacheIndex] = temp;

    // Synchronize threads in this block
    __syncthreads();

    // Ensure warp efficiency by utilizing consecutive threads effectively
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (cacheIndex < stride) {
            cache[cacheIndex] += cache[cacheIndex + stride];
        }
        __syncthreads();
    }

    // Write results to the output array
    if (cacheIndex == 0) {
        c[blockIdx.x] = cache[0];
    }
}