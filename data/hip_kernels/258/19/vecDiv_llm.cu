#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecDiv(float* a, float* b, float* c, const int N) {
    // Use shared memory to minimize global memory accesses
    __shared__ float sharedA[256]; // Adjust size as needed based on blockDim.x
    __shared__ float sharedB[256]; // Adjust size as needed based on blockDim.x

    const int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load elements into shared memory
        sharedA[threadIdx.x] = a[i];
        sharedB[threadIdx.x] = b[i];
        __syncthreads();

        // Perform division using shared memory
        c[i] = __fdividef(sharedA[threadIdx.x], sharedB[threadIdx.x]);
    }
}