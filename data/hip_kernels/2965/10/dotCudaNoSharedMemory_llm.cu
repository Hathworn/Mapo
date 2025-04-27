#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotCudaNoSharedMemory(const float* a, const float* b, float* dest, const size_t length) {
    // Calculate the unique thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize a partial sum variable for each thread
    float partialSum = 0.0f;
    
    // Use a loop to accumulate products into the partial sum
    for (size_t i = idx; i < length; i += blockDim.x * gridDim.x) {
        partialSum += a[i] * b[i];
    }
    
    // Use atomicAdd to safely accumulate partial sums into global memory
    atomicAdd(dest, partialSum);
}