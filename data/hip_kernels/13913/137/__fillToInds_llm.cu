#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds(float A, float *B, int *I, long long len) {
    // Calculate global unique thread ID
    long long tid = threadIdx.x + blockIdx.x * blockDim.x + gridDim.x * (blockIdx.y * blockDim.x);
    // Calculate the total number of threads executing the kernel
    long long step = blockDim.x * gridDim.x * gridDim.y;

    for (long long i = tid; i < len; i += step) {
        // Assign value A to specific indices in B array
        B[I[i]] = A;
    }
}