#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSquare(float* gData, float* target, unsigned int numElements) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory to reduce global memory access
    __shared__ float sharedData[1024]; // Adjust size based on your block size

    if (idx < numElements) {
        sharedData[threadIdx.x] = gData[idx];
    }
    __syncthreads();

    // Process elements using shared memory
    for (unsigned int i = idx; i < numElements; i += blockDim.x * gridDim.x) {
        if (i < numElements) {
            target[i] = sharedData[threadIdx.x] * sharedData[threadIdx.x];
        }
    }
}