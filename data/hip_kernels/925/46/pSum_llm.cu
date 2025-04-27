#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int getGid3d3d() {
    int blockId = blockIdx.x + blockIdx.y * gridDim.x + gridDim.x * gridDim.y * blockIdx.z;
    int threadId = blockId * (blockDim.x * blockDim.y * blockDim.z) + (threadIdx.y * blockDim.x) 
                 + (threadIdx.z * (blockDim.x * blockDim.y)) + threadIdx.x;
    return threadId;
}

__global__ void pSum(double* __restrict__ in1, double* __restrict__ output, int pass) {
    unsigned int tid = threadIdx.x;
    unsigned int bid = blockIdx.y * gridDim.x + blockIdx.x; // Optimized bid calculation
    extern __shared__ double sdata2[];

    // Pre-load shared memory with input data
    sdata2[tid] = in1[getGid3d3d()];
    __syncthreads();

    for(int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if(tid < i) { // Reduced unnecessary loads and checks
            sdata2[tid] += sdata2[tid + i];
        }
        __syncthreads();
    }

    if(tid == 0) {
        output[bid] = sdata2[0];
    }
}