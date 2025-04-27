#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for input data
    extern __shared__ float sharedData[];
    if (idx < vectorSize) {
        sharedData[threadIdx.x] = data[idx];
        __syncthreads();
        // Perform reciprocal operation
        data[idx] = 1.0 / sharedData[threadIdx.x];
    }
}