#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    // Use shared memory to optimize memory accesses
    __shared__ float sharedData[1024];

    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < vectorSize) {
        // Load data into shared memory
        sharedData[threadIdx.x] = data[idx];
        __syncthreads();

        // Perform computation
        sharedData[threadIdx.x] = 1.0f / sharedData[threadIdx.x];
        __syncthreads();

        // Store results back to global memory
        data[idx] = sharedData[threadIdx.x];
    }
}