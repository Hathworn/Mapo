#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardDifferenceKernel(const int len, const float* __restrict__ source, float* __restrict__ target) {
    // Use shared memory for faster access
    extern __shared__ float shared_source[];

    int localIdx = threadIdx.x + 1;
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x + 1;

    if (globalIdx < len - 1) {
        // Load element into shared memory
        shared_source[localIdx] = source[globalIdx - 1];
        shared_source[localIdx + 1] = source[globalIdx];

        __syncthreads();

        // Compute forward difference using shared memory
        target[globalIdx] = shared_source[localIdx + 1] - shared_source[localIdx];
    }
}