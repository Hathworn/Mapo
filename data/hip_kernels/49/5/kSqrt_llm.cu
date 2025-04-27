#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSqrt(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for better memory access pattern
    extern __shared__ float sharedData[];
    
    if (idx < numElements) {
        sharedData[threadIdx.x] = gData[idx];
        __syncthreads();

        // Perform the computation
        target[idx] = sqrtf(sharedData[threadIdx.x]);
    }
}