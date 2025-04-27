#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToIndsX(float A, float *B, long long len) {
    // Utilize shared memory to reduce global memory access
    __shared__ float sharedA;
    if (threadIdx.x == 0) {
        sharedA = A;
    }
    __syncthreads();
    
    // Calculate the global thread index
    int tid = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    int step = blockDim.x * gridDim.x * gridDim.y;

    // Fill array using faster shared variable
    for (long long i = tid; i < len; i += step) {
        B[i] = sharedA;
    }
}