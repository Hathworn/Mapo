#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaGetError(int N, double *ana, double *cur, double *e_sum) {
    // Use shared memory to reduce global memory access
    __shared__ double sharedSum[256]; // Assuming blockDim.x is at most 256
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    double diff = 0.0;
    if (index < (N+1)*(N+1)) {
        diff = (ana[index] - cur[index]) * (ana[index] - cur[index]);
    }
    sharedSum[threadIdx.x] = diff;

    // Perform reduction in shared memory
    __syncthreads();
    if (threadIdx.x < 128) sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 128];
    __syncthreads();
    if (threadIdx.x < 64) sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 64];
    __syncthreads();
    if (threadIdx.x < 32) {
        sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 32];
        sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 16];
        sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 8];
        sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 4];
        sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 2];
        sharedSum[threadIdx.x] += sharedSum[threadIdx.x + 1];
    }

    // Sum up results from each block
    if (threadIdx.x == 0) atomicAdd(e_sum, sharedSum[0]);
}