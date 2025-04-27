#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniform_float(int n, float lower, float upper, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;
    
    // Use stride loop to ensure all elements are processed
    while (i < n) {
        float u = result[i];
        result[i] = u * upper + (1.0f - u) * lower; // Optimize: use 1.0f for float consistency
        i += totalThreads; // Process another element in the next iteration
    }
}