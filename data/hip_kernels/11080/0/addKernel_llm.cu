#include "hip/hip_runtime.h"
#include "includes.h"
#define N 64

__global__ void addKernel(float *a, float *b) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory access latency
    __shared__ float shared_a[blockDim.x];
    __shared__ float shared_b[blockDim.x];

    if (idx < N) {
        shared_a[threadIdx.x] = a[idx];
        shared_b[threadIdx.x] = b[idx];
        __syncthreads();

        // Perform addition in shared memory
        shared_a[threadIdx.x] += shared_b[threadIdx.x];
        __syncthreads();

        // Write the results back to global memory
        a[idx] = shared_a[threadIdx.x];
    }
}