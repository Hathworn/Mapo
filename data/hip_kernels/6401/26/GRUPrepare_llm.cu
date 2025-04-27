#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void finish(unsigned int* counter) {
    __syncthreads();
    __threadfence();
    if (threadIdx.x == 0) { 
        atomicAdd(counter, 1); 
    }
}

__global__ void GRUPrepare(unsigned int* finished, const int round) {
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use all threads to initialize `finished` array if large; handle out of bounds
    for (int i = idx; i < round; i += gridDim.x * blockDim.x) {
        finished[i] = 0;
    }
}