#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hist_inGlobal(const int* values, int length, int* hist) {
    // Calculate global thread index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Calculate stride to handle more elements per thread
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to cache histogram updates
    __shared__ int local_hist[256]; // Assume 'values' range from 0 to 255

    // Initialize shared memory
    if (threadIdx.x < 256) {
        local_hist[threadIdx.x] = 0;
    }
    __syncthreads();

    // Iterate with stride
    while (idx < length) {
        int val = values[idx];
        // Use atomic operations in shared memory
        atomicAdd(&local_hist[val], 1);
        idx += stride;
    }
    __syncthreads();

    // Move shared memory results to global memory
    if (threadIdx.x < 256) {
        atomicAdd(&hist[threadIdx.x], local_hist[threadIdx.x]);
    }
}