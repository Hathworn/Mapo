#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to load data for efficient access
extern __shared__ float sharedAcc[];

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use block shared memory to reduce global memory access
    int tid = threadIdx.x;
    if (tid == 0) {
        sharedAcc[0] = *accuracy;
    }
    __syncthreads();

    // Have one thread perform the division
    if (tid == 0) {
        sharedAcc[0] /= N;
    }
    __syncthreads();

    // Write result back to global memory
    if (tid == 0) {
        *accuracy = sharedAcc[0];
    }
}