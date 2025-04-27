#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void totalSequential(float *input, float *output, int len) {
    // Each thread computes part of the reduction
    extern __shared__ float sharedData[]; // Use shared memory for partial sums
    int tid = threadIdx.x;
    int globalIndex = blockIdx.x * blockDim.x + tid;

    sharedData[tid] = (globalIndex < len) ? input[globalIndex] : 0.0f;
    __syncthreads(); // Ensure all threads have written to sharedData

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sharedData[tid] += sharedData[tid + s];
        }
        __syncthreads(); // Synchronize before the next iteration
    }

    // Write the result for this block to global memory
    if (tid == 0) {
        output[blockIdx.x] = sharedData[0];
    }
}