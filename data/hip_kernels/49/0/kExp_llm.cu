#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExp(float* gData, float* target, unsigned int numElements) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ float sharedData[];
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned int i = idx; i < numElements; i += stride) {
        sharedData[threadIdx.x] = gData[i];
        __syncthreads();  // Ensure sharedData is updated

        target[i] = __expf(sharedData[threadIdx.x]);
        __syncthreads();  // Ensure all threads have written before next iteration
    }
}