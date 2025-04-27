#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TanhBackKernel(float* Z, float* dZ, int size) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for potential performance gains (assuming size is small enough)
    __shared__ float sharedZ[1024]; // Adjust size according to blockDim.x
    __shared__ float sharedDZ[1024]; // Adjust size according to blockDim.x

    if (id < size) {
        // Load data into shared memory
        sharedZ[threadIdx.x] = Z[id];
        sharedDZ[threadIdx.x] = dZ[id];
        __syncthreads();

        // Perform computation using shared memory
        float t = sharedZ[threadIdx.x];
        dZ[id] = sharedDZ[threadIdx.x] * (1 - t * t);
    }
}