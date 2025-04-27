#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(float *loc, float *temp, const int num) {
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid atomic operation in every thread by using shared memory
    __shared__ float tempSum[1024]; // Ensures shared memory space for block

    // Initialize shared memory
    tempSum[threadIdx.x] = (idx < num) ? temp[idx] : 0.0f;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride && (idx + stride) < num) {
            tempSum[threadIdx.x] += tempSum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Atomic addition only once per block
    if (threadIdx.x == 0 && idx < num) {
        atomicAdd(loc, tempSum[0]);
    }
}