#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(const float *input, float *output, int numElements) {
    // Get global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if thread is within bounds
    if (tid < numElements) {
        // Use shared memory to accumulate results
        extern __shared__ float sharedData[];
        
        // Initialize shared memory
        sharedData[threadIdx.x] = input[tid];
        __syncthreads();

        // Perform reduction in shared memory
        for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            if (threadIdx.x < stride) {
                sharedData[threadIdx.x] += sharedData[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Write result for this block to global memory
        if (threadIdx.x == 0) {
            atomicAdd(output, sharedData[0]);
        }
    }
}