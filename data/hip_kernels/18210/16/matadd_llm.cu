#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matadd(const float *a, const float *b, float *c, int n, int m) {
    // Calculate linear thread index in grid
    int idx = blockIdx.x * blockDim.x * m + blockIdx.y * blockDim.y + threadIdx.y * m + threadIdx.x; 
    int totalThreads = gridDim.x * blockDim.x * gridDim.y * blockDim.y;
    
    // Loop to process multiple elements by a single thread
    for (int i = idx; i < n * m; i += totalThreads) {
        c[i] = a[i] + b[i];
    }
}